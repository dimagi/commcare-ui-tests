@MenuTests
Feature: Test all primary CommCare menu options

  Scenario: Test that all actions available from the home screen options menu work properly

    Then I install the ccz app at "settings_sheet_tests.ccz"
    Then I login with username "settings.test" and password "123"

   # Just verifying that the buttons work properly; the actual feature is tested elsewhere
    Then I select "Advanced" menu item
    Then I touch the "Wifi Direct" text
    Then I see the text "Do you want to send, receive, or submit forms?"
    Then I press view with id "negative_button"
    Then I verify that the current activity is "CommCareWiFiDirectActivity"
    Then I go back to the home screen




