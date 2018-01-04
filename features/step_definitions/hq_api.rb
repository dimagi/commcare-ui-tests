require 'yaml'
require 'net/http'
require 'json'
require 'uri'
require 'date'

Then (/^I check form was uploaded$/) do
  was_upload_success = assert_new_form_on_hq()
  if not was_upload_success
    fail("No new form submission since last check")
  end
end

Then (/^I store most recent form submission time$/) do
  store_latest_form_time()
end

Then (/^I check that (\d+) attachments for latest form are on HQ$/) do |attachment_count|
  # since the form.xml is counted as an attachment, increment count
  attachment_count_including_form = attachment_count.to_i + 1
  correct_attachment_count = assert_attachments(attachment_count_including_form)
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
  in_group = is_user_in_group(user_id, group_id)
  if not in_group
    set_user_group(user_id, group_id)
    in_group = is_user_in_group(user_id, group_id)
    if not in_group
      fail("Could not successfully add user to group")
    end
  end
end

Then (/^I make sure that user "([^\"]*)" is not in group "([^\"]*)"$/) do |user_id, group_id|
  in_group = is_user_in_group(user_id, group_id)
  if in_group
    set_user_group(user_id, '[]')
    in_group = is_user_in_group(user_id, group_id)
    if in_group
      fail("Could not successfully remove user from group")
    end
  end
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


def assert_attachments(expected_count)
  attachment_count = get_latest_form_attachment_count()
  if expected_count != attachment_count
      puts("#{expected_count} attachments expected, #{attachment_count} found")
      return false
  end
  return true
end

def get_latest_form_attachment_count
   form = get_forms()[0]
   form_id = form['id']
   attachments = form['attachments']
   attachments_with_data = 0
   for attachment_name in attachments.keys
       file_size = get_attachment(form_id, attachment_name)
       if file_size > 0
          attachments_with_data += 1
       end
   end
   return attachments_with_data
end

def get_attachment(form_id, attachment_name)
  uri = URI("https://www.commcarehq.org/a/commcare-tests/api/form/attachment/#{form_id}/#{attachment_name}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Get.new(uri.request_uri)
  set_auth(req)
  resp = http.request(req)
  return resp.body.size
end

def assert_new_form_on_hq()
  file = open("latest_form_time.txt", 'r')
  old_form_submit_time = file.readline().to_i
  file.close
  if old_form_submit_time >= get_latest_form_time()
      return false
  end
  return true
end

def get_forms()
  return get_request("form")['objects']
end

def get_latest_form_time()
   date_str = get_forms()[0]['received_on']
   return DateTime.rfc3339(date_str).to_time.to_i
end

def store_latest_form_time()
  form_file = open("latest_form_time.txt", 'w')
  form_file.write(get_latest_form_time())
  form_file.close
end

def get_mobile_worker(userid)
  return get_request("user/#{userid}/?format=json")
end

def get_groups_for_user(userid)
  user_json = get_mobile_worker(userid)
  return user_json["groups"]
end

def is_user_in_group(userid, groupid)
  groups = get_groups_for_user(userid)
  if groups.include? groupid
    return true
  else
    return false
  end
end

def set_user_group(userid, groupid)
  if groupid == "[]"
        update_mobile_worker(userid, '{"groups": []}')
  else
        update_mobile_worker(userid, "{\"groups\": [\"#{groupid}\"]}")
        # update_mobile_worker(userid, '{"groups": ["78185f2132bd8ba3af30b488f9974b41"]}')
  end
end

def get_workerid_by_name(username)
  workers = get_request("user")["objects"]
  matching_workers = []
  workers.each do |worker|
      matching_workers << worker if worker["username"] == get_domian_username(username)
  end

  if matching_workers.count != 1
    raise "username #{username} matched #{matching_workers.count} workers"
  end
  return matching_workers[0]
end

def update_mobile_worker(userid, payload)
  uri = URI("https://www.commcarehq.org/a/commcare-tests/api/v0.5/user/#{userid}/")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Put.new(uri.path, 'Content-Type' => 'application/json')
  req.body = payload
  set_auth(req)
  resp = http.request(req)
  if resp.code.to_i >= 200 and resp.code.to_i < 300
    puts("Successfully updated worker with user_id #{userid}")
  else
    raise "Request to update worker with user_id #{userid} failed with code #{resp.code} and error #{resp}"
  end
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
  uri = URI("https://www.commcarehq.org/a/commcare-tests/api/v0.5/#{action}/")
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

def get_domian_username(username)
  return "#{username}@commcare-tests.commcarehq.org"
end