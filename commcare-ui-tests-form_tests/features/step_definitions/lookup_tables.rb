Then (/^I upload the "([^\"]*)" lookup table$/) do |path|
  was_upload_success = system("python3 commcare-hq-api/commcare_hq_api.py upload_fixture features/resource_files/lookup_tables/#{path}")
  if not was_upload_success
    fail("Unable to upload the #{path} lookup table")
  end
end
