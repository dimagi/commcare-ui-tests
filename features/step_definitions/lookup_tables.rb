Then (/^I upload the "([^\"]*)" lookup table$/) do |path|
  was_upload_success = upload_fixture("features/resource_files/lookup_tables/#{path}")
  if not was_upload_success
    fail("Unable to upload the #{path} lookup table")
  end
end