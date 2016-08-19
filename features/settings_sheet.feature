Feature: Settings Sheet of the QA test plan
@QA

Scenario: Verify that all server settings menus can be opened and edited

	# INSTALL APP AND LOGIN
	Then I install the ccz app at "settings_sheet_tests.ccz"
	Then I login with username "settings.test" and password "123"


	# NAVIGATE TO MAIN SETTINGS MENU > SERVER SETTINGS
	Then I select "Settings" from the menu
	Then I see the text "CommCare > Application Preferences"
	Then I touch the "Server Settings" text


	# APPLICATION SERVER
	Then I touch the "CommCare Application Server" text

	# Make sure that a dialog with the correct title and edit text appear, and that it persists on rotation
	Then I see the text "CommCare Application Server"
	Then I should see text containing "https://www.commcarehq.org/a/ui-tests/apps/download/"
	Then I rotate to landscape
	Then I see the text "CommCare Application Server"
	Then I should see text containing "https://www.commcarehq.org/a/ui-tests/apps/download/"
	Then I rotate to portrait

	# Verify that we are back on the Server Settings screen	
	Then I touch the "OK" text
	Then I see the text "CommCare > Server Settings"


	# DATA SERVER
	Then I touch the "Data Server" text

	# Make sure that a dialog with the correct title and edit text appear, and that it persists on rotation
	Then I see the text "CommCare Data Server"
	Then I should see text containing "https://www.commcarehq.org/a/ui-tests/phone/restore/"
	Then I rotate to landscape
	Then I see the text "CommCare Data Server"
	Then I should see text containing "https://www.commcarehq.org/a/ui-tests/phone/restore/"
	Then I rotate to portrait

	# Verify that we are back on the Server Settings screen	
	Then I touch the "OK" text
	Then I see the text "CommCare > Server Settings"


	# SUBMISSION SERVER
	Then I touch the "Submission Server" text

	# Make sure that a dialog with the correct title and edit text appear, and that it persists on rotation
	Then I see the text "CommCare Submission Server"
	Then I should see text containing "https://www.commcarehq.org/a/ui-tests/receiver/"
	Then I rotate to landscape
	Then I see the text "CommCare Submission Server"
	Then I should see text containing "https://www.commcarehq.org/a/ui-tests/receiver/"
	Then I rotate to portrait

	# Verify that we are back on the Server Settings screen	
	Then I touch the "OK" text
	Then I see the text "CommCare > Server Settings"


	# KEY SERVER
	Then I touch the "Key Server" text

	# Make sure that a dialog with the correct title and edit text appear, and that it persists on rotation
	Then I see the text "Key Server"
	Then I should see text containing "https://pact.dimagi.com/keys/getkey"
	Then I rotate to landscape
	Then I see the text "Key Server"
	Then I should see text containing "https://pact.dimagi.com/keys/getkey"
	Then I rotate to portrait

	# Verify that we are back on the Server Settings screen	
	Then I touch the "OK" text
	Then I see the text "CommCare > Server Settings"


	# FORM RECORD SERVER
	Then I touch the "Form Record Server" text

	# Make sure that a dialog with the correct title and edit text appear, and that it persists on rotation
	Then I see the text "Form Record Server"
	Then I see an empty EditText
	Then I rotate to landscape
	Then I see the text "Form Record Server"
	Then I see an empty EditText
	Then I rotate to portrait

	# Verify that we are back on the Server Settings screen	
	Then I touch the "OK" text
	Then I see the text "CommCare > Server Settings"


Scenario: Verify that Auto Update Frequency settings are working

	Then I login with username "settings.test" and password "123"
	Then I select "Settings" from the menu
	Then I see the text "CommCare > Application Preferences"
	
	Then I touch the "Auto Update Frequency" text
	Then I see the text "Never"
	Then I see the text "Daily"
	Then I see the text "Weekly"
	Then I touch the "Daily" text

	# Verify that the window closes and we return to the Application Preferences screen
	Then I don't see the text "Never"
	Then I don't see the text "Daily"
	Then I don't see the text "Weekly"
	Then I see the text "CommCare > Application Preferences"

	# Make sure 'Daily' is now selected
	Then I touch the "Auto Update Frequency" text
	Then I check that the "Daily" item in the CheckedTextView list is selected

