#Install Multimedia
#Clear_text step because I've found the field remains populated after the first time the file is pushed.
Then (/^I install the multimedia at "([^\"]*)"$/) do |path|
  push("features/resource_files/multimedia/%s" % path, "/sdcard/%s" % path)
  step("I wait for progress")
  clear_text("id:'screen_multimedia_inflater_location")
  step("I enter \"storage/emulated/0/%s\" into input field number 1" % path)
  hide_soft_keyboard()

  tap_when_element_exists("* {text CONTAINS[c] 'Install Multimedia'}")
  step("I wait for progress")
end

# perform install through app manager. Same steps as install app, just without the wait step at the end. It causes test to fail through app manager.
Then (/^I install the app using app manager at "([^\"]*)"$/) do |url|
  step("I scroll until I see the \"enter_app_location\" id")
  tap_when_element_exists("* id:'enter_app_location'")
  enter_text("android.widget.EditText id:'edit_profile_location'", url)
  tap_when_element_exists("* id:'start_install'")
  step("I scroll until I see the \"btn_start_install\" id")
  tap_when_element_exists("* id:'btn_start_install'")
  wait_for_element_exists("* id:'install_app_button'")
end

#Multiple Apps Selector
Then (/^I don't see the app selector button$/) do
	wait_for_element_does_not_exist("* id:'app_selection_spinner'")
end

Then (/^I see the app selector button$/) do
	wait_for_element_exists("* id:'app_selection_spinner'")
end

#Then I select "Install Multimedia" does not work for this option. Janky workaround
Then (/^I access Install Multimedia$/) do 
  touch("com.android.internal.view.menu.ActionMenuPresenter$OverflowMenuButton marked:'More options'")
  sleep 1
  tap_when_element_exists("* {text CONTAINS[c] 'Install Multimedia'}")
end