require 'yaml'
require 'net/http'
require 'json'
require 'uri'

Then (/^I check form was uploaded$/) do
  was_upload_success = system("python3 commcare-hq-api/utils.py assert_newer_form")
  if not was_upload_success
    fail("No new form submission since last check")
  end
end

Then (/^I store most recent form submission time$/) do
  system("python3 commcare-hq-api/utils.py store_latest_form")
end

Then (/^I stage a recovery sync$/) do
  system("python3 scripts/ccc invalidate")
end

Then (/^I check that (\d+) attachments for latest form are on HQ$/) do |attachment_count|
  # since the form.xml is counted as an attachment, increment count
  attachment_count_including_form = attachment_count.to_i + 1
  correct_attachment_count = system("python3 commcare-hq-api/utils.py assert_attachments #{attachment_count_including_form}")
  if not correct_attachment_count
    fail("Submitted form didn't contain the expected #{attachment_count} attachments")
  end
end

Then (/^I store case list count$/) do
  sleep(1) # TODO: better blocking while case list loads
  list_count = query("ListView","getAdapter","getCount").first
  file = open("case_list_count.txt", 'w')
  file.write(list_count)
  file.close
end

Then (/^I assert case list count against stored count$/) do
  sleep(1) # TODO: better blocking while case list loads
  list_count = query("ListView","getAdapter","getCount").first
  file = open("case_list_count.txt", 'r')
  expected_count = file.readline()
  file.close
  File.delete("case_list_count.txt")

  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I close case with name "([^\"]*)" of type "([^\"]*)" as user_id "([^\"]*)"$/) do |name, type, user_id|
  system("python3 commcare-hq-api/utils.py close_case_named #{name} #{type} #{user_id}")
end

Then (/^I make sure that user "([^\"]*)" is in group "([^\"]*)"$/) do |user_id, group_id|
  in_group = system("python3 commcare-hq-api/utils.py assert_group_membership #{user_id} #{group_id}")
  if not in_group
    system("python3 commcare-hq-api/utils.py set_user_group #{user_id} #{group_id}")
    in_group = system("python3 commcare-hq-api/utils.py assert_group_membership #{user_id} #{group_id}")
    if not in_group
      fail("Could not successfully add user to group")
    end
  end
end

Then (/^I make sure that user "([^\"]*)" is not in group "([^\"]*)"$/) do |user_id, group_id|
  in_group = system("python3 commcare-hq-api/utils.py assert_group_membership #{user_id} #{group_id}")
  if in_group
    system("python3 commcare-hq-api/utils.py set_user_group #{user_id} []")
    in_group = system("python3 commcare-hq-api/utils.py assert_group_membership #{user_id} #{group_id}")
    if in_group
      fail("Could not successfully remove user from group")
    end
  end
end

Then (/^I set the next restore to clear cache$/) do
  system("python3 scripts/ccc clear_restore_cache")
end

Then (/^I check that an async restore occurred successfully$/) do
  # Indicates that at least 1 retry response was received
  wait_for_element_exists("* {text CONTAINS[c] 'Waiting for Server Progress'}'", timeout: 25)

  # Allow the async restore to take up to 5 minutes to send back a full response
  wait_for_element_exists("* {text CONTAINS[c] 'Processing Data from Server'}'", timeout: 300)

  wait_for_element_exists("* id:'home_gridview_buttons'", timeout: 30)
end

Then (/^I check that an async incremental sync occurred successfully$/) do
  # Indicates that at least 1 retry response was received
  wait_for_element_exists("* {text CONTAINS[c] 'Waiting for Server Progress'}'", timeout: 25)

  # Allow the async restore to take up to 5 minutes to send back a full response
  wait_for_element_exists("* {text CONTAINS[c] 'Processing Data from Server'}'", timeout: 300)

  wait_for_element_does_not_exist("android.widget.ProgressBar")
end

Then (/^I delete the user with name "([^\"]*)"$/) do |name|
  # system("python3 commcare-hq-api/commcare_hq_api.py delete_worker_named #{name}")
  # make a get request to get all workers for the domain 
  # and then filter them by name to get userid
  userid = get_workerid_by_name(name)
  delete_worker(userid)
end

def get_workerid_by_name(username)
  workers = get_request("user")["objects"]
  matching_ids = []
  workers.each do |worker|
      matching_ids << worker["id"] if worker["username"] == get_domian_username(username)
  end

  if matching_ids.count != 1
    raise "username #{username} matched #{matching_ids.count} workers"
  end

  return matching_ids[0]
end

def delete_worker(userid)
  uri = URI("https://www.commcarehq.org/a/commcare-tests/api/v0.5/user/#{userid}/")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Delete.new(uri.path)
  set_auth(req)
  resp = http.request(req)
  if resp.code.to_i >= 200 and resp.code.to_i < 300
    puts("Successfully deleted worker with user_id #{userid}")
  else
    raise "Request to delete worker with user_id #{userid} failed with code #{resp.code} and error #{resp}"
  end
end

def set_auth(req)
  properties = YAML.load_file("features/resource_files/local.properties.yaml")
  web_username = properties['hqauth']['username']
  web_password = properties['hqauth']['password']
  req.basic_auth web_username, web_password
end

def get_request(action)
  uri = URI('https://www.commcarehq.org/a/commcare-tests/api/v0.5/user/')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Get.new(uri.request_uri)
  set_auth(req)

  resp = http.request(req)
  if resp.code == '200'
    return JSON.parse(resp.body)
  else
    raise "request to #{uri} failed with code #{resp.code}"
  end
end

Then (/^I create a user with name "([^\"]*)" and password "([^\"]*)"$/) do |username, password|
  
  uri = URI('https://www.commcarehq.org/a/commcare-tests/api/v0.5/user/')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
  set_auth(req)

  req.body ="{
    \"first_name\": \"Temporary\",
    \"last_name\": \"User\",
    \"username\": \"#{get_domian_username(username)}\",
    \"password\": \"#{password}\"
  }"

  resp = http.request(req)
  puts(resp.body)
end

def get_domian_username(username)
  return "#{username}@commcare-tests.commcarehq.org"
end