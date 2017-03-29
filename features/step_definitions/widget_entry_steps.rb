
# CONFIRMATION BOX
Then (/^I see the message "([^\"]*)" with a confirmation box.$/) do |message|
  step("I see the text \"#{message}\"")
  if element_does_not_exist("android.widget.CheckBox")
    fail("No confirmation box present")
  end
end

Then (/^I see the message "([^\"]*)" with no confirmation box.$/) do |message|
  step("I see the text \"#{message}\"")
  if element_exists("android.widget.CheckBox")
    fail("Confirmation box is present")
  end
end

# SINGLE SELECT WIDGET
Then (/^I see (\d+) select options in a single-select$/) do |expected_count|
  list_count = query("org.commcare.views.widgets.SelectOneWidget", "getChildCount")[0] / 2
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I select option from single-select with text "([^\"]*)"$/) do |target_text|
  touch("RadioButton text:'#{target_text}'")
end

Then(/^I check that the "([^"]*)" item in the single-select list is selected$/) do |item_text|
	is_checked = query("org.commcare.views.widgets.SelectOneWidget:'#{item_text}'", "isChecked")[0]
	if not is_checked
		fail("The specified RadioButton is not selected")
	end
end 

Then(/^I check that the "([^"]*)" item in the single-select list is not selected$/) do |item_text|
	is_checked = query("org.commcare.views.widgets.SelectOneWidget:'#{item_text}'", "isChecked")[0]
	if not is_checked
		fail("The specified Single Select option was selected")
	end
end 

#MULTI-SELECT WIDGET
Then (/^I see (\d+) select options in a multi-select$/) do |expected_count|
  list_count = query("org.commcare.views.widgets.SelectMultiWidget", "getChildCount")[0] / 2
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I select option from multi-select with text "([^\"]*)"$/) do |target_text|
  touch("CheckBox text:'#{target_text}'")
end

Then(/^I check that the "([^"]*)" item in the multi-select list is selected$/) do |item_text|
	is_checked = query("org.commcare.views.widgets.SelectMultiWidget:'#{item_text}'", "isChecked")[0]
	if not is_checked
		fail("The specified Mutliple Select option is not selected")
	end
end 

#MINIMAL SINGLE-SELECT WIDGET
Then (/^I select the single-select dropdown list$/) do
	touch('Spinner')
end

Then (/^I select "([^"]*)" from the single-select dropdown list$/) do |target_text|
	touch("TextView text:'#{target_text}'")
end

#COMPACT SINGLE-SELECT WIDGET
#TODO: implement actually answering this (right now it just checks that the structure is correct)
Then (/^I see a compact single-select widget with row labels "([^\"]*)" and options "([^\"]*)"$/) do |row_labels, options|
  
  row_labels = row_labels.split(",")
  test_text_views_present_in_order(row_labels)

  options = options.split(",")
  test_text_views_present_in_order(options)

  # Assert that the number of radio buttons present is equivalent to 1 for each option, for each row label
  num_possible_choices = row_labels.length * options.length
  num_choices_on_screen = query("android.widget.RadioButton text:''").count
  if (num_possible_choices != num_choices_on_screen)
    fail("The number of radio buttons present is not correct, based upon the given labels and options")
  end
end
 
#SINGLE-SELECT LIST
Then(/^I press single-select item number "([^"]*)"$/) do |arg1|
  query("RadioButton index:0")
  tap_when_element_exists("RadioButton index:#{arg1}")
  sleep(1)
end

Then(/^I check that single-select item number "([^"]*)" is selected$/) do |arg1|
	is_checked = query("RadioButton index:0:'#{arg1}','isChecked'")[0]
	if not is_checked
		fail("The specified option was not selected")
	end
end

#TODO: Implement validation steps/confirm options actually selected. 
Then(/^I press single-select image number "([^"]*)"$/) do |arg1|
  query("imageView index:0")
  tap_when_element_exists("imageView index:#{arg1}")
  sleep(1)
end

Then(/^I check that single-select image number "([^"]*)" is selected$/) do |arg1|
	is_checked = query("imageView index:0:'#{arg1}','isChecked'")[0]
	if not is_checked
		fail("The specified option was not selected")
	end
end

# Assert that all of the given text views are present, and appear in the order they were inputted
def test_text_views_present_in_order(labels)
  all_text_views = query("android.widget.TextView")

  index_of_previous_label = -1
  previous_label = ""
  for label in labels
    if element_exists("android.widget.TextView text:'#{label}'")
      index_in_dom = all_text_views.index(query("android.widget.TextView text:'#{label}'").first)
      if index_in_dom < index_of_previous_label
        fail("Text views are not present in the order provided. %s appears before %s" % [label, previous_label])
      index_of_previous_label = index_in_dom
      previous_label = label
      end
    else
      fail("Missing expected text view %s" % [label])
    end
  end
end

# DATE-TIME WIDGET
# NOT WORKING
Then (/^I enter today's date$/) do 
  date = Time.new
  step("I set the date to #{date} on DatePicker with index \"0\"")
end


# INTEGER WIDGET
Then (/^I test an integer widget question$/) do
  # Test that the keyboard is in numeric-only format
  keyboard_enter_text("abc")
  step("I don't see the text \"abc\"")
  keyboard_enter_text("000")
  step("I see the text \"000\"")
  test_persistence("000")
end

def test_persistence(entered_text)
   step("Next")
   step("Prev")
   step("I see the text \"#{entered_text}\"")
end


# Also a numeric-only question, but via a regex instead of being an integer widget
Then (/^I test a question that requires numeric entry$/) do
  keyboard_enter_text("abc")
  step("Next")
  step("I see the text \"Sorry, this response is invalid!\"")
  clear_answers()
  keyboard_enter_text("123")
end

def clear_answers()
  clear_text("android.widget.EditText")
end


# SIGNATURE WIDGET
Then (/^I test a signature widget question$/) do
  step("I press button with text \"Gather Signature\"")
  step("I sign with a cross")
  step("I press button with text \"Save and Close\"")
end

# COMBOBOX WIDGET
Then (/^I select the combobox text field$/) do
	touch('Combobox')
end

Then (/^I clear the combobox text field$/) do
  clear_text_in("* org.commcare.views.Combobox")
end

