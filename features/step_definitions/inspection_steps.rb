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
  attempts = 4
  while true
    count = 0
    while count < attempts
      break if element_exists("* id:'#{id}'")
      scroll_down
      count = count + 1;
    end
    break if element_exists("* id:'#{id}'")
    count = 0
    while count < attempts
      break if element_exists("* id:'#{id}'")
      scroll_up
      count = count + 1;
    end
    break if element_exists("* id:'#{id}'")
    attempts = attempts * 5
  end
end

Then (/^I scroll until I see the "([^\"]*)" text$/) do |text|
  attempts = 4
  while true
    count = 0
    while count < attempts
      break if element_exists("* {text CONTAINS[c] '#{text}'}")
      pan_down
      count = count + 1
    end
    count = 0
    break if element_exists("* {text CONTAINS[c] '#{text}'}")
    while count < attempts
      break if element_exists("* {text CONTAINS[c] '#{text}'}")
      pan_up
      count = count + 1
    end
    break if element_exists("* {text CONTAINS[c] '#{text}'}")
    attempts = attempts * 5
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

Then (/^I verify that all home buttons are present$/) do
  expected_texts = ['Start', 'Sync with Server', 'Log out']
  check_home_buttons(expected_texts)
end

Then (/^I verify that demo home buttons are present$/) do
  expected_texts = ['Explore CommCare', 'Submit Practice Data to Server', 'Log out']
  check_home_buttons(expected_texts)
end

Then (/^I see at least one element of type "([^\"]*)"$/) do |element|
  count = query("#{element}").length
  if count < 1
    fail("Didn't find any occurrences of a %s element" % element)
  end
end

Then (/^I check that id "([^\"]*)" is enabled$/) do |element_id|
  check_element_exists("* id:'#{element_id}' enabled:'true'")
end

Then (/^I check that id "([^\"]*)" is disabled/) do |element_id|
  check_element_exists("* id:'#{element_id}' enabled:'false'")
end

Then (/^I see view with id "([^\"]*)"$/) do |id|
  if not element_exists("* id:'#{id}'")
    fail("No element exists with id " % id)
  end
end

Then (/^I do not see view with id "([^\"]*)"$/) do |id|
  if element_exists("* id:'#{id}'")
    fail("Found element that should not be present with id " % id)
  end
end

Then (/^I press view with class "([^\"]*)"$/) do |className|
  tap_when_element_exists("#{className}")
end

Then (/^I see the tile expand button$/) do
  if not element_exists("* id:'com_tile_holder_btn_open'")
      fail("Did not see the tile expand button")
  end
end

Then (/^I don't see the tile expand button$/) do
  if element_exists("* id:'com_tile_holder_btn_open'")
      fail("Should not see the tile expend button")
  end
end

Then (/^I press the tile expand button$/) do
  tap_when_element_exists("* id:'com_tile_holder_btn_open'")
end



def check_home_buttons( expected_texts)
  for button_text in expected_texts
    scroll_count = 0
    # scroll until text is found, otherwise timeout
    while true
      break if element_exists("* {text CONTAINS[c] '#{button_text}'}")
      if scroll_count > 10
        fail("Didn't find %s button" % button_text)
      end
      scroll_count += 1
      pan_up
    end

    # scroll back to original place
    while scroll_count > 0
      pan_down
      scroll_count -= 1
    end
  end
end

Then (/^I see one item from the list "([^\"]*)"$/) do |items|
  saw_item = false
  for item in items.split(",")
    if element_exists("* {text CONTAINS[c] '#{item}'}")
      saw_item = true
    end
  end
  if !saw_item
    fail("Did not see item from list \"#{items}\".")
  end
end