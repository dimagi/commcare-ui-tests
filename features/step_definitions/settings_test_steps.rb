
Then (/^After selecting the "([^\"]*)" item in the CheckedTextView list for the "([^\"]*)" setting, rotate, re-enter, and make sure it is still selected$/) do |item_text, setting_name|
	
	# Verify that the window closed and we return to the Application Preferences screen
	step("I see the text \"CommCare > Application Preferences\"")
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

Then (/^I see a list that contains all of these items "([^\"]*)"$/) do |all_items|
	for item in all_items.split(",")
		step("I see the text \"#{item}\"")
	end
end