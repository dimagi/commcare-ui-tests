
Then (/^After selecting the "([^\"]*)" item in the CheckedTextView list for the "([^\"]*)" setting, rotate, re-enter, and make sure it is still selected$/) do |item_text, setting_name|
	
	# Verify that the window closed and we return to the Settings screen
	step("I see the text \"CommCare > Settings\"")
	wait_for_element_does_not_exist("android.widget.CheckedTextView")

	step("I rotate to landscape")

	step("I scroll until I see the \"#{setting_name}\" text")
	step("I touch the \"#{setting_name}\" text")
	step("I wait")
	step("I check that the \"#{item_text}\" item in the CheckedTextView list is selected")

	step("I rotate to portrait")
end

Then (/^I check that the "([^\"]*)" item in the CheckedTextView list is selected$/) do |item_text|
	is_checked = query("android.widget.CheckedTextView text:'#{item_text}'", "isChecked")[0]
	if not is_checked
		fail("The specified CheckedTextView is not selected")
	end
end

Then (/^I see the expected recovery mode UI$/) do
	if query("* {text CONTAINS 'CommCare has entered Recovery Mode due to a problem with the local device'}").length != 1 or query("* {text CONTAINS 'This device has no unsent forms'}").length != 1 or query("* {text CONTAINS 'App is installed and valid'}").length != 1 or query("* {text CONTAINS 'Waiting'}").length != 1
		fail("Expected text not found")
	end
	
	if query("button text:'Send Data' isEnabled:false").length != 1
		fail("Send Data button not found")
	end

	if query("button text:'Attempt Reinstall' isEnabled:false").length != 1
		fail("Attempt Reinstall button not found")
	end
end
