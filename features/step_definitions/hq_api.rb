Then (/^I check form was uploaded$/) do
  was_upload_success = system("python3 commcare-hq-api/utils.py assert_newer_form")
  if not was_upload_success
    fail("No new form submission since last check")
  end
end

Then (/^I store most recent form submission time$/) do
  system("python3 commcare-hq-api/utils.py store_latest_form")
end

Then (/^I check that (\d+) attachments for latest form are on HQ$/) do |attachment_count|
  correct_attachment_count = system("python3 commcare-hq-api/utils.py assert_attachments #{attachment_count}")
  if not correct_attachment_count
    # TODO
    fail("No new form submission since last check")
  end
end
