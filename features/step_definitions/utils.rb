
# This assumes that the file is in features/resource_files, so the filename you provide should start there
Then (/^I push the file named "([^\"]*)" to the phone$/) do |filename|
	push("features/resource_files/%s" % path, "/sdcard/%s" % path)
end