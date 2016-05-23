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
  keyboard_enter_text("'#{text}'")
end

Then (/^I login with username "([^\"]*)" and password "([^\"]*)"$/) do |username, password|
  wait_for_element_exists("* id:'edit_password'", timeout: 6000)
  enter_text("android.widget.AutoCompleteTextView id:'edit_username'", username)
  enter_text("android.widget.EditText id:'edit_password'", password)
  tap_when_element_exists("* id:'login_button'")
  wait_for_element_exists("* id:'home_gridview_buttons'", timeout: 6000)
end

Then (/^I select module "([^\"]*)"$/) do |text|
  wait_for_element_exists("* id:'screen_suite_menu_list'")
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then (/^I wait for form entry$/) do
  wait_for_element_exists("* id:'nav_pane'")
end

Then (/^Next$/) do
  tap_when_element_exists("* id:'nav_btn_next'")
end

Then (/^Submit/) do
  if element_exists("* id:'nav_btn_finish'")
    tap_when_element_exists("* id:'nav_btn_finish'")
  else
    tap_when_element_exists("* id:'nav_btn_next'")
  end
end

Then (/^I go back to the home screen$/) do
  while true
    press_back_button

    if element_exists("* {text CONTAINS[c] 'EXIT WITHOUT SAVING'}")
      tap_when_element_exists("* {text CONTAINS[c] 'EXIT WITHOUT SAVING'}")
    end

    # wait before checking if we are on the home screen because activity
    # dispatch goes through the home screen causing this to always be true if
    # checked immediately
    sleep 1
    break if element_exists("* {text CONTAINS[c] 'Sync with Server'}")
  end
end

Then (/^Prev$/) do
  tap_when_element_exists("* id:'nav_btn_prev'")
end

Then (/^Rotate Portrait$/) do
  perform_action('set_activity_orientation', 'portrait')
end

Then (/^I see (\d+) list entries$/) do |expected_count|
  list_count = query("ListView","getAdapter","getCount").first
  if list_count.to_i != expected_count.to_i
    fail("Expected to see %s entries but got %s" % [expected_count, list_count])
  end
end
