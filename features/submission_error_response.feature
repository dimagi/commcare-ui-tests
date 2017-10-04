@Integration
Feature: Test mobile handling of 422 response to form submission

Scenario: Submit a form with an index to a case that doesn't exist 
	
	# Push the form .xml to the phone
	Then I push the file named "missing_case_form.xml" to the phone

	Then I install the ccz app at "integration_test_app.ccz"
	Then I login with username "test" and password "123"

	# Tell CommCare that the form we load should be marked as unsent
	Then I select "Settings" menu item
	Then I touch the "Developer Options" text
	Then I touch the "Load form payload status" text
	Then I touch the "Unsent" text

	# Load the form
	Then I touch the "Local Form Payload File" text
	