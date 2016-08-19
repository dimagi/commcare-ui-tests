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


Scenario: Verify that Fuzzy Search Matches settings are working

	Then I login with username "settings.test" and password "123"
	Then I select "Settings" from the menu
	Then I see the text "CommCare > Application Preferences"
	
	Then I touch the "Fuzzy Search Matches" text
	Then I see a list that contains all of these items "Enabled,Disabled"
	Then I check that the "Enabled" item in the CheckedTextView list is selected

	Then I touch the "Disabled" text
	Then After selecting the "Disabled" item in the CheckedTextView list for the "Fuzzy Search Matches" setting, rotate, re-enter, and make sure it is still selected

	Then I touch the "Enabled" text
	Then After selecting the "Enabled" item in the CheckedTextView list for the "Fuzzy Search Matches" setting, rotate, re-enter, and make sure it is still selected

	Then I touch the "Cancel" text
	Then I see the text "CommCare > Application Preferences"


Scenario: Verify that Auto Update Frequency settings are working

	Then I login with username "settings.test" and password "123"
	Then I select "Settings" from the menu
	Then I see the text "CommCare > Application Preferences"
	
	Then I touch the "Auto Update Frequency" text
	Then I see a list that contains all of these items "Never,Daily,Weekly"

	Then I touch the "Daily" text
	Then After selecting the "Daily" item in the CheckedTextView list for the "Auto Update Frequency" setting, rotate, re-enter, and make sure it is still selected

	Then I touch the "Weekly" text
	Then After selecting the "Weekly" item in the CheckedTextView list for the "Auto Update Frequency" setting, rotate, re-enter, and make sure it is still selected

	Then I touch the "Never" text
	Then After selecting the "Never" item in the CheckedTextView list for the "Auto Update Frequency" setting, rotate, re-enter, and make sure it is still selected

	Then I touch the "Cancel" text
	Then I see the text "CommCare > Application Preferences"

