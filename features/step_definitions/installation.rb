# perform normal network install using app code
Then (/^I install the app at "([^\"]*)"$/) do |url|
  step("I scroll until I see the \"enter_app_location\" id")
  tap_when_element_exists("* id:'enter_app_location'")
  enter_text("android.widget.EditText id:'edit_profile_location'", url)
  tap_when_element_exists("* id:'start_install'")
  step("I scroll until I see the \"btn_start_install\" id")
  tap_when_element_exists("* id:'btn_start_install'")
  wait_for_element_exists("* id:'edit_password'", timeout: 6000)
end

# peform offline install using ccz file pushed from repository
Then (/^I install the ccz app at "([^\"]*)"$/) do |path|
  step("I rotate to portrait")
  wait_for_element_exists("* {text contains[c] 'Welcome to CommCare'}", timeout: 6000)
  press_menu_button()
  tap_when_element_exists("* {text CONTAINS[c] 'Offline install'}")
  push("features/resource_files/ccz_apps/%s" % path, "/sdcard/%s" % path)
  step("I enter \"storage/emulated/0/%s\" into input field number 1" % path)
  hide_soft_keyboard()

  # get around bug where the install button is disabled after entering text
  step("I rotate to landscape")
  sleep 1
  step("I rotate to portrait")
  sleep 1

  tap_when_element_exists("* {text CONTAINS[c] 'Install App'}")
  wait_for_element_exists("* id:'edit_password'", timeout: 6000)
end

Then (/^I do an offline update to the ccz app at "([^\"]*)"$/) do |path|
  press_menu_button()
  tap_when_element_exists("* {text CONTAINS[c] 'Update App'}")
  wait_for_element_exists("* {text contains[c] 'Current version'}", timeout: 1000)
  press_menu_button()
  tap_when_element_exists("* {text CONTAINS[c] 'Offline Update'}")
  push("features/resource_files/ccz_apps/%s" % path, "/sdcard/%s" % path)
  step("I enter \"storage/emulated/0/%s\" into input field number 1" % path)
  hide_soft_keyboard()

  # get around bug where the install button is disabled after entering text
  step("I rotate to landscape")
  sleep 1
  step("I rotate to portrait")
  sleep 1

  tap_when_element_exists("* {text CONTAINS[c] 'Update App'}")
  tap_when_element_exists("* {text CONTAINS[c] 'Update to version'}'")
  step("I wait for progress")
end

Then (/^I uninstall the "([^\"]*)" apk app$/) do |apk|
  system("adb uninstall %s" % apk)
end

Then (/^I install the "([^\"]*)" apk$/) do |apk|
  system("adb install -r features/resource_files/apks/%s.apk" % apk)
end
