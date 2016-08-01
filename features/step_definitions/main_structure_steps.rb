Then (/^I scroll until I see the "([^\"]*)" id$/) do |id|
  while true
    pan_up
    break if element_exists("* id:'#{id}'")
  end
end

Then (/^I scroll until I see the "([^\"]*)" text$/) do |text|
  while true
    pan_up
    break if element_exists("* {text CONTAINS[c] '#{text}'}")
  end
end

Then (/^I enter my name$/) do
  keyboard_enter_text("Will")
end

Then (/^I enter test$/) do
  keyboard_enter_text("test")
end

Then (/^I close the keyboard$/) do
  hide_soft_keyboard()
end

Then (/^I enter text "([^\"]*)"$/) do |text|
  keyboard_enter_text("#{text}")
end

Then (/^I login with username "([^\"]*)" and password "([^\"]*)"$/) do |username, password|
  step("I login with username \"%s\" and password \"%s\", without waiting for home screen" % [username, password])
  wait_for_element_exists("* id:'home_gridview_buttons'", timeout: 60)
end

Then (/^I login with username "([^\"]*)" and password "([^\"]*)", without waiting for home screen$/) do |username, password|
  wait_for_element_exists("* id:'edit_password'", timeout: 60)
  clear_text_in("android.widget.AutoCompleteTextView id:'edit_username'")
  enter_text("android.widget.AutoCompleteTextView id:'edit_username'", username)
  clear_text_in("android.widget.EditText id:'edit_password'")
  enter_text("android.widget.EditText id:'edit_password'", password)
  tap_when_element_exists("* id:'login_button'")
end

Then (/^I select module "([^\"]*)"$/) do |text|
  wait_for_element_exists("* id:'screen_suite_menu_list'")
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

# same as module selection, just used for user clarity
Then (/^I select form "([^\"]*)"$/) do |text|
  wait_for_element_exists("* id:'screen_suite_menu_list'")
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then (/^I wait for form entry$/) do
  wait_for_element_exists("* id:'nav_pane'")
end

Then (/^I rotate to landscape/) do
  perform_action('set_activity_orientation', 'landscape')
end

Then (/^I rotate to portrait$/) do
  perform_action('set_activity_orientation', 'portrait')
end

Then (/^I rotate to landscape/) do
  perform_action('set_activity_orientation', 'landscape')
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

Then (/^I update the app$/) do
  press_menu_button()
  tap_when_element_exists("* {text CONTAINS[c] 'Update App'}")
  wait_for_element_exists("* {text CONTAINS[c] 'Update to version'}'", :timeout => 10)
end

Then (/^I apply the update/) do
  tap_when_element_exists("* {text CONTAINS[c] 'Update to version'}'")
  step("I wait for progress")
end

Then (/^I don't find the text "([^\"]*)"$/) do |text|
  sleep 1
  count = query("* {text CONTAINS[c] '#{text}'}").length
  if count != 0
    fail("Found %s occurrences of %s; expected none" % [count, text])
  end
end
