@MenuTests
Feature: Test all primary CommCare menu options

  Scenario: Test that all actions available from the home screen options menu work properly

    Then I install the ccz app at "settings_sheet_tests.ccz"
    Then I login with username "settings.test" and password "123"

    Then I open the options menu
    Then I see the text "Update App"
    Then I see the text "Saved Forms"
    Then I see the text "Change Language"
    Then I see the text "About CommCare"
    Then I see the text "Advanced"
    Then I see the text "Settings"
    Then I rotate to landscape
    Then I see the text "Update App"
    Then I see the text "Saved Forms"
    Then I see the text "Change Language"
    Then I see the text "About CommCare"
    Then I see the text "Advanced"
    Then I see the text "Settings"
    Then I rotate to portrait
    Then I go back to the home screen

   # Necessary due to some inexplicable behavior in calabash where it isn't able to select anything from the options menu subsequently without this initial call
    Then I open the options menu

    Then I select "Update App" menu item
    Then I verify that the current activity is "UpdateActivity"
    Then I see the text "App is up to date"
    Then I go back to the home screen

    Then I select "Saved Forms" menu item
    Then I verify that the current activity is "FormRecordListActivity"
    Then I touch the "Filter By: All Completed Forms" text
    Then I see a list that contains all of these items "Filter By: All Completed Forms,Filter By: Only Submitted Forms,Filter By: Only Unsent Forms,Only Incomplete Forms,Filter: Quarantined Forms"
    Then I go back to the home screen

    Then I select "Change Language" menu item
    Then I see a choice dialog with 2 panels
    Then I go back

    Then I select "About CommCare" menu item
    Then I see the text "About CommCare"
    Then I press view with id "button1"
    Then I wait

    Then I select "Advanced" menu item
    Then I see the text "CommCare > Advanced"
    Then I see a list that contains all of these items "Wifi Direct,Manage SD,Report Problem,Force Log Submission,Validate Media,Connection Test,Recovery Mode,Clear User Data"
    Then I go back to the home screen

    Then I select "Settings" menu item
    Then I wait to see "CommCare > Settings"
    Then I see a list that contains all of these items "Auto Update Frequency,Set Print Template,Grid Menus Enabled,Fuzzy Search Matches,Opt Out of Analytics"
    Then I go back to the home screen

  Scenario: Test that all actions available from the Advanced Actions menu work properly

    Then I login with username "settings.test" and password "123"

   # NOT ABLE TO TEST "Report Problem"

    Then I select "Advanced" menu item
    Then I touch the "Validate Media" text
    Then I see the text "multimedia is installed"
   # Wait until we are back on the home screen
    Then I wait
    Then I scroll until I see the "Start" text

   # Just verifying that the buttons work properly; the actual feature is tested elsewhere
    Then I select "Advanced" menu item
    Then I touch the "Manage SD" text
    Then I see the text "Do not use this feature unless you have been trained to do so. Do you wish to proceed?"
    Then I press view with id "negative_button"
    Then I wait to see "CommCare > Advanced"
    Then I touch the "Manage SD" text
    Then I see the text "Do not use this feature unless you have been trained to do so. Do you wish to proceed?"
    Then I press view with id "positive_button"
    Then I see the text "Dump Forms"
    Then I see the text "Submit Forms"
    Then I go back
    Then I touch the "Manage SD" text
    Then I don't see the text "Do not use this feature unless you have been trained to do so. Do you wish to proceed?"
    Then I go back to the home screen

   # Just verifying that the buttons work properly; the actual feature is tested elsewhere
    Then I select "Advanced" menu item
    Then I touch the "Wifi Direct" text
    Then I see the text "Do you want to send, receive, or submit forms?"
    Then I press view with id "negative_button"
    Then I verify that the current activity is "CommCareWiFiDirectActivity"
    Then I go back to the home screen

    Then I select "Advanced" menu item
    Then I touch the "Connection Test" text
    Then I touch the "Run Connection Test" text
    Then I see the text "Running Connection Tests"
    Then I wait to see "No problems were detected."
    Then I turn off the internet
    Then I touch the "Run Connection Test" text
    Then I wait to see "Please run this test again after verifying your network connection."
    Then I turn on the internet
    Then I go back to the home screen

   # NOT ABLE TO TEST "Force Log Submission"

    Then I select "Advanced" menu item
    Then I touch the "Recovery Mode" text
    Then I see the expected recovery mode UI
    Then I go back to the home screen

    Then I select "Advanced" menu item
    Then I touch the "Clear User Data" text
    Then I press view with id "positive_button"
    Then I see the text "Welcome back! Please log in."



