Feature: Multiple Applications Test

  Scenario: Install Multiple Applications to Device
    Then I install the ccz app at "languages.ccz"
    Then I select "Go to App Manager" menu item
    Then I press "Install An App"
    Then I wait for progress

   #Install using app code via Application Manager
    Then I install the app using app manager at "2fGi0M8"
    Then I see the text "Language Test"
    Then I see the text "Test: List Searching"

   #Cannot install more than 2 apps
    Then I press "Install An App"
    Then I see the text "You have reached your limit"
    Then I press "Back to App Manager"
    Then I wait for progress

   #Confirm 2 apps on Login Screen
    Then I go back
    Then I see the app selector button
    Then I press view with id "app_selection_spinner"
    Then I press "Language Test"
    Then I wait for progress
    Then I see the app selector button

   #Archive app and confirm 1 app on login screen
    Then I select "Go to App Manager" menu item
    Then I wait for progress
    Then I press "Test: List Searching"
    Then I press "Archive"
    Then I see the text "Unarchive"
    Then I go back
    Then I wait
    Then I go back
    Then I don't see the app selector button

   #Unarchive the first application
    Then I select "Go to App Manager" menu item
    Then I wait for progress
    Then I press "Test: List Searching"
    Then I press "Unarchive"
    Then I see the text "Archive"

    Then I go back
    Then I wait for progress
    Then I go back
    Then I see the app selector button

   #Update Application
    Then I select "Go to App Manager" menu item
    Then I press "Language Test"
    Then I see the text "App Version: 102"
    Then I see the text "Uninstall"
    Then I see the text "Update"

    Then I press "Update"
    Then I see the text "Current version: 102"
    Then I press "Update to version 103"
    Then I wait for progress

   #Assert to confirm all options appear
    Then I see the text "App Version: 103"
    Then I see the text "Uninstall"
    Then I see the text "Update"

   #Uninstall to test functionality and prep for next test
    Then I press "Uninstall"
    Then I see the text "Uninstalling your app"
    Then I press "OK"
    Then I wait for progress

      #Restarting now puts you back in the app manager
    Then I wait
    Then I go back
    Then I wait
    Then I see the text "Welcome back! Please log in."
    Then I don't see the app selector button

   #Confirm in app manager
    Then I select "Go to App Manager" menu item
    Then I see the text "Test: List Searching"
    Then I don't see the text "Language Test"

  Scenario: Validate MM
   #Installing app for MM tests
    Then I select "Go to App Manager" menu item
    Then I wait for progress
    Then I press "Install An App"
    Then I install the app using app manager at "2gJtNLa"

   #Press Retry and confirm nothing changes
    Then I press "Retry"
    Then I see the text "Skip For Now"
    Then I see the text "Retry"

    Then I press "Skip For Now"
    Then I see "Media Not Verified"
    Then I press "OK"

   #Confirm only 1 app on login screen
    Then I go back
    Then I go back
    Then I don't see the app selector button

   #Confirm you can Install Multimedia
    Then I select "Go to App Manager" menu item
    Then I press "Multiple Apps"
    Then I press "Validate Multimedia"
    Then I select "Install Multimedia" menu item
    Then I install the multimedia at "commcare.zip"

   #Confirm 2 apps on login screen
    Then I see the text "Multiple Apps"
    Then I go back
    Then I wait for progress
    Then I go back
    Then I see the app selector button

   #Confirm validate MM gone from App Manager
    Then I select "Go to App Manager" menu item
    Then I press "Multiple Apps"
    Then I don't see "Validate Multimedia"
