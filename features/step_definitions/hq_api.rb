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
  # since the form.xml is counted as an attachment, increment count
  attachment_count_including_form = attachment_count.to_i + 1
  correct_attachment_count = system("python3 commcare-hq-api/utils.py assert_attachments #{attachment_count_including_form}")
  if not correct_attachment_count
    fail("Submitted form didn't contain the expected #{attachment_count} attachments")
  end
end
