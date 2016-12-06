Feature: Test all primary CommCare menu options

@QA
Scenario: Test that all actions available from the home screen options menu work properly 

	Then I install the ccz app at "settings_sheet_tests.ccz"
	Then I login with username "settings.test" and password "123"

	Then I select "Advanced" from the menu
	Then I touch the "Clear User Data" text
	Then I press view with id "positive_button"
	Then I verify that the current activity is "LoginActivity"