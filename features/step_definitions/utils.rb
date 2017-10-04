
Then (/^I load the form payload at "([^\"]*)" onto the phone as a "([^\"]*)" form$/) do |payload_path, form_status|
	if form_status != "incomplete" and form_status != "saved" and form_status != "unsent"
		fail("Must specify a form status of either incomplete, saved, or unsent")
	end

	# Add the form payload to the phone's file system. 
	# This assumes that the file is in features/resource_files/payloads
	push("features/resource_files/payloads/%s" % payload_path, "/sdcard/%s" % payload_path)
	
	# Get to Developer Options
	press_menu_button()
	tap_when_element_exists("* {text CONTAINS[c] 'Settings'}")
	step("I scroll until I see the \"Developer Options\" text")
	tap_when_element_exists("* {text CONTAINS[c] 'Developer Options'}")

	# Set the status that the payload should be loaded as
	step("I scroll until I see the \"Load form payload status\" text")
	tap_when_element_exists("* {text CONTAINS[c] 'Load form payload status'}")
	tap_when_element_exists("* {text CONTAINS[c] '#{form_status}'}")

	# Set the path to the file
	step("I scroll until I see the \"Local Form Payload File\" text")
	sleep 2
	tap_when_element_exists("* {text CONTAINS[c] 'Local Form Payload File'}")
	enter_text("android.widget.EditText id:'edit'", "storage/emulated/0/%s" % payload_path)
	tap_when_element_exists("* {text CONTAINS[c] 'OK'}")

end
