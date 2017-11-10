Then (/^I close the keyboard$/) do
  hide_soft_keyboard()
end

Then (/^I enter text "([^\"]*)"$/) do |text|
  keyboard_enter_text("#{text}")
end

Then (/^I login with username "([^\"]*)" and password "([^\"]*)"$/) do |username, password|
  step("I login with username \"%s\" and password \"%s\", without waiting for completion" % [username, password])
  wait_for_element_exists("* id:'home_gridview_buttons'", timeout: 60)
end

Then (/^I login with username "([^\"]*)" and password "([^\"]*)", without waiting for completion$/) do |username, password|
  perform_action('set_activity_orientation', 'portrait')
  sleep 1
  wait_for_element_exists("* id:'edit_password'", timeout: 60)
  clear_text_in("android.widget.AutoCompleteTextView id:'edit_username'")
  enter_text("android.widget.AutoCompleteTextView id:'edit_username'", username)
  clear_text_in("android.widget.EditText id:'edit_password'")
  enter_text("android.widget.EditText id:'edit_password'", password)
  tap_when_element_exists("* id:'login_button'")
end

Then (/^I auth for install from list with username "([^\"]*)" and domain "([^\"]*)" and password_key "([^\"]*)"$/) do |username, domain, password_key|
  require 'yaml'
  properties = YAML.load_file("features/resource_files/local.properties.yaml")
  password = properties['passwords'][password_key]

  clear_text_in("* id:'edit_username'")
  enter_text("* id:'edit_username'", username)
  hide_soft_keyboard()
  clear_text_in("* id:'edit_domain'")
  enter_text("* id:'edit_domain'", domain)
  hide_soft_keyboard()
  clear_text_in("* id:'edit_password'")
  enter_text("* id:'edit_password'", password)
  hide_soft_keyboard()
  tap_when_element_exists("* {text CONTAINS[c] 'See Available Apps'}")
  wait_for_element_exists("* id:'apps_list_container'", timeout: 60)
end

Then (/^I auth for install from list with email "([^\"]*)" and password_key "([^\"]*)"$/) do |email, password_key|
  require 'yaml'
  properties = YAML.load_file("features/resource_files/local.properties.yaml")
  password = properties['passwords'][password_key]

  clear_text_in("* id:'edit_email'")
  enter_text("* id:'edit_email'", email)
  hide_soft_keyboard()
  clear_text_in("* id:'edit_password'")
  enter_text("* id:'edit_password'", password)
  hide_soft_keyboard()
  tap_when_element_exists("* {text CONTAINS[c] 'See Available Apps'}")
  wait_for_element_exists("* id:'apps_list_container'", timeout: 60)
end

Then (/^I install app "([^\"]*)" from the list of available apps$/) do |appName|
  tap_when_element_exists("* {text CONTAINS[c] '#{appName}'}")
  wait_for_element_exists("* {text CONTAINS[c] 'Setting Up App'}")
  # Wait until the install dialog goes away
  wait_for_element_does_not_exist("android.widget.ProgressBar")
  # After the install process, we'll either end up on the install screen or the app
  # manager, both of which should be showing the app name if the install was successful
  wait_for_element_exists("* {text CONTAINS[c] '#{appName}'}")
end


Then (/^I press login$/) do
  tap_when_element_exists("* id:'login_button'")
end

Then (/^I sync$/) do
  step("I sync, without waiting for completion")
  wait_for_element_does_not_exist("android.widget.ProgressBar")
  sleep 1
  count = query("android.widget.ProgressBar")
  if count != 0
    wait_for_element_does_not_exist("android.widget.ProgressBar")
  end
end

Then (/^I sync, without waiting for completion$/) do
  sleep 1
  if current_activity() != "StandardHomeActivity"
    step("I go back to the home screen")
  end
  tap_when_element_exists("* {text CONTAINS[c] 'Sync with Server'}")
end

Then (/^I wait for syncing to complete$/) do
  count = query("android.widget.ProgressBar")
  if count != 0
    wait_for_element_does_not_exist("android.widget.ProgressBar")
  end
end

Then (/^I select module "([^\"]*)"$/) do |text|
  wait_for_element_exists("* id:'screen_suite_menu_list'")
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then (/^I open the incomplete form with title "([^\"]*)"$/) do |title|
  tap_when_element_exists("* {text CONTAINS[c] '#{title}'}")
  tap_when_element_exists("* {text CONTAINS[c] 'Go To Start'}")
  wait_for_element_exists("* id:'nav_pane'")
end

# same as module selection, just used for user clarity
Then (/^I select form "([^\"]*)"$/) do |text|
  wait_for_element_exists("* id:'screen_suite_menu_list'")
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
  # wait for form loading to finish
  wait_for_element_exists("* id:'nav_pane'")
end

Then (/^I rotate to portrait$/) do
  perform_action('set_activity_orientation', 'portrait')
  step("I wait for 5 seconds")
end

Then (/^I rotate to landscape/) do
  perform_action('set_activity_orientation', 'landscape')
  step("I wait for 5 seconds")
end

Then (/^I update the app$/) do
  press_menu_button()
  tap_when_element_exists("* {text CONTAINS[c] 'Update App'}")
  wait_for_element_exists("* {text CONTAINS[c] 'Update to version'}'", :timeout => 30)
end

Then (/^I apply the update/) do
  tap_when_element_exists("* {text CONTAINS[c] 'Update to version'}'")
  step("I wait for progress")
end

Then (/^I enable Developer Options/) do
  for i in 0..4
    press_menu_button()
    tap_when_element_exists("* {text CONTAINS[c] 'About CommCare'}")
    tap_when_element_exists("* id:'button1'")
  end
end

Then (/^I enable the "([^\"]*)" Developer Option/) do |setting_name|
  press_menu_button()
  tap_when_element_exists("* {text CONTAINS[c] 'Settings'}")
  tap_when_element_exists("* {text CONTAINS[c] 'Developer Options'}")
  tap_when_element_exists("* {text CONTAINS[c] '#{setting_name}'}")
  tap_when_element_exists("CheckedTextView {text CONTAINS[c] 'Enabled'}")
end


Then (/^I open the options menu$/) do
  press_menu_button()
end

Then (/^I select case "([^\"]*)"$/) do |text|
  wait_for_element_exists("* id:'screen_entity_select_list'")
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then (/^I wait for form to load/) do
  wait_for_element_exists("* id:'nav_pane'")
end

Then (/^I robust touch the "([^\"]*)" text$/) do |text|
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
  step("I wait for 10 seconds")
end