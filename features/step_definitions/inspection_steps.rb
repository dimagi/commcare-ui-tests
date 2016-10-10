Then (/^I see "([^"]*)" above "([^"]*)"$/) do |first,second|
  text_on_screen = query("Textview","text")

  first_index = text_on_screen.find_index(first)
  if first_index.nil?
      raise "View does not contain text #{first}"
  end

  second_index = text_on_screen.find_index(second)
  if second_index.nil?
      raise "View does not contain text #{second}"
  end

  if first_index > second_index
      raise "Text #{first} was seen below #{second}"
  end
end

Then (/^I scroll until I see the "([^\"]*)" id$/) do |id|
  while true
    break if element_exists("* id:'#{id}'")
    pan_up
  end
end

Then (/^I scroll until I see the "([^\"]*)" text$/) do |text|
  while true
    break if element_exists("* {text CONTAINS[c] '#{text}'}")
    pan_up
  end
end

Then (/^I see (\d+) list entries$/) do |expected_count|
  list_count = query("ListView","getAdapter","getCount").first
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I see (\d+) select options$/) do |expected_count|
  list_count = query("org.commcare.views.widgets.SelectOneWidget", "getChildCount")[0] / 2
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end

Then (/^I see a list that contains all of these items "([^\"]*)"$/) do |all_items|
  for item in all_items.split(",")
    step("I scroll until I see the \"#{item}\" text")
  end
end

Then (/^I see a choice dialog with (\d+) panels$/) do |expected_count|
  panel_count = query("* id:'choice_dialog_panel'").length
  if panel_count.to_i != expected_count.to_i
    fail("Expected to see %s choice panels but got %s" % [expected_count, panel_count])
  end
end

Then (/^I rename file "([^\"]*)" to "([^\"]*)"$/) do |original_filename, new_filename|
  system("mv #{original_filename} #{new_filename}")
end

Then (/^I see an empty EditText$/) do
  wait_for_element_exists("android.widget.EditText text:''")
end

Then (/^I verify that the current activity is "([^\"]*)"$/) do |activity_name|
  if current_activity != activity_name
    fail("Current activity is %s, but expected %s" % [current_activity, activity_name])
  end
end

Then (/^I see at least one element of type "([^\"]*)"$/) do |element|
  count = query("#{element}").length
  if count < 1
    fail("Didn't find any occurrences of %s" % text)
  end
end

Then (/^I check that id "([^\"]*)" is enabled$/) do |element_id|
  check_element_exists("* id:'#{element_id}' enabled:'true'")
end

Then (/^I check that id "([^\"]*)" is disabled/) do |element_id|
  check_element_exists("* id:'#{element_id}' enabled:'false'")
end

