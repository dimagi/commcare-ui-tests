@Integration
Feature: Test mobile handling of 422 response to form submission

Scenario: Submit a form with an index to a case that doesn't exist 

	Then I install the ccz app at "integration_test_app.ccz"
	Then I login with username "test" and password "123"

	Then I load the form payload at "missing_case_form.xml" onto the phone as a "unsent" form
	