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
