Then (/^I check that the "([^\"]*)" item in the CheckedTextView list is selected$/) do |item_text|
	is_checked = query("android.widget.CheckedTextView text:'#{item_text}'", "isChecked")[0]
	if not is_checked
		fail("The specified CheckedTextView is not selected")
	end
end