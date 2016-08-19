
Then (/^I select the "([^\"]*)" item in a CheckedTextView list with items "([^\"]*)", exit, rotate, re-enter, and make sure it is still selected$/) do |item_text, all_items|
	step("I touch the \"#{item_text}\" text")
	
	# Verify that the window closes and we return to the Application Preferences screen
	for item in all_items.split(",")
		step("I don't see the text \"#{item}\"")
	end
	step("I see the text \"CommCare > Application Preferences\"")
	
	step("I rotate to landscape")

	# Now re-enter and make sure "Daily" is still selected
	step("I touch the \"Auto Update Frequency\" text")
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