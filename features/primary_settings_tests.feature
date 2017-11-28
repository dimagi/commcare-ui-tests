@Settings
Feature: Test settings on the "Application Preferences" screen
  
  Scenario: Test that the "Fuzzy Search Matches" setting can be edited properly
    
    Then I install the ccz app at "settings_sheet_tests.ccz"
    Then I login with username "settings.test" and password "123"
    Then I select "Settings" menu item
    Then I wait to see "CommCare > Settings"

    Then I touch the "Fuzzy Search Matches" text
    Then I see a list that contains all of these items "Enabled,Disabled"
    Then I check that the "Enabled" item in the CheckedTextView list is selected

    Then I touch the "Disabled" text
    Then After selecting the "Disabled" item in the CheckedTextView list for the "Fuzzy Search Matches" setting, rotate, re-enter, and make sure it is still selected

    Then I touch the "Enabled" text
    Then After selecting the "Enabled" item in the CheckedTextView list for the "Fuzzy Search Matches" setting, rotate, re-enter, and make sure it is still selected

    Then I touch the "Cancel" text
    Then I wait to see "CommCare > Settings"

  Scenario: Test that the "Auto Update Frequency" setting can be edited properly

    Then I login with username "settings.test" and password "123"
    Then I select "Settings" menu item
    Then I wait to see "CommCare > Settings"

    Then I touch the "Auto Update Frequency" text
    Then I see a list that contains all of these items "Never,Daily,Weekly"

    Then I touch the "Daily" text
    Then After selecting the "Daily" item in the CheckedTextView list for the "Auto Update Frequency" setting, rotate, re-enter, and make sure it is still selected

    Then I touch the "Weekly" text
    Then After selecting the "Weekly" item in the CheckedTextView list for the "Auto Update Frequency" setting, rotate, re-enter, and make sure it is still selected

    Then I touch the "Never" text
    Then After selecting the "Never" item in the CheckedTextView list for the "Auto Update Frequency" setting, rotate, re-enter, and make sure it is still selected

    Then I touch the "Cancel" text
    Then I see the text "CommCare > Settings"

  Scenario: Verify that the "Set Print Template" setting opens a file browser of some sort

    Then I login with username "settings.test" and password "123"
    Then I select "Settings" menu item
    Then I wait to see "CommCare > Settings"

    Then I touch the "Set Print Template" text
    Then I wait
    Then I don't see the text "Your device does not have a file browser installed. Please download one from the playstore and then try again."
