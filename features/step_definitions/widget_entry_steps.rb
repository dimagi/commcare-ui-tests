
# CONFIRMATION BOX
Then (/^I see the message "([^\"]*)" with a confirmation box.$/) do |message|
  step("I see the text \"#{message}\"")
  if element_does_not_exist("android.widget.CheckBox")
    fail("No confirmation box present")
  end
end


# SINGLE SELECT WIDGET
Then (/^I see (\d+) select options in a single-select$/) do |expected_count|
  list_count = query("org.commcare.views.widgets.SelectOneWidget", "getChildCount")[0] / 2
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I see (\d+) select options in a multi-select$/) do |expected_count|
  list_count = query("org.commcare.views.widgets.SelectMultiWidget", "getChildCount")[0] / 2
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end


#COMPACT SINGLE-SELECT WIDGET
#TODO: implement actually answering this (right now it just checks that the structure is correct)
Then (/^I see a compact single-select widget with row labels "([^\"]*)" and options "([^\"]*)"$/) do |row_labels, options|
  row_labels = row_labels.split(",")
  options = options.split(",")

  all_text_views = query("android.widget.TextView")

  # Assert that all of the row labels are present, and appear in the order they were inputted
  index_of_previous_label = -1
  previous_label = ""
  for row_label in row_labels
    if element_exists("android.widget.TextView text:'#{row_label}'")
      index_in_dom = all_text_views.index(query("android.widget.TextView text:'#{row_label}'").first)
      if index_in_dom < index_of_previous_label
        fail("Row labels are not present in the order provided. %s appears before %s" % [row_label, previous_label])
      index_of_previous_label = index_in_dom
      previous_label = row_label
      end
    else
      fail("Missing expected row label %s" % [row_label])
    end
  end

  # Assert that all of the options are present, and appear in the order they were inputted
  index_of_previous_option = -1
  previous_option = ""
  for option in options
    if element_exists("android.widget.TextView text:'#{option}'")
      index_in_dom = all_text_views.index(query("android.widget.TextView text:'#{option}'").first)
      if index_in_dom < index_of_previous_option
        fail("Options are not present in the order provided. %s appears before %s" % [option, previous_option])
      index_of_previous_option = index_in_dom
      previous_option = option
      end
    else
      fail("Missing expected option %s" % [option])
    end
  end

  # Assert that the number of radio buttons present is equivalent to 1 for each option, for each row label
  num_possible_choices = row_labels.length * options.length
  num_choices_on_screen = query("android.widget.RadioButton text:''").count
  if (num_possible_choices != num_choices_on_screen)
    fail("The number of radio buttons present is not correct, based upon the given labels and options")
  end
end
    

# MULTI SELECT WIDGET
Then (/^I select option from single-select with text "([^\"]*)"$/) do |target_text|
  touch("RadioButton text:'#{target_text}'")
end

Then (/^I select option from multi-select with text "([^\"]*)"$/) do |target_text|
  touch("CheckBox text:'#{target_text}'")
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
