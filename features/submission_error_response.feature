@Integration
Feature: Test mobile handling of 422 response to form submission

Scenario: Submit a form with an index to a case that doesn't exist 

	Then I install the ccz app at "invalid_index_app.ccz"
	Then I login with username "test" and password "123"
	Then I press start
	Then I select module "Parents"
	Then I touch the "Create Child with invalid index" text
	# select case
	Then I touch the "Parent 2" text
    Then I touch the "Continue" text
    Then I wait for form to load
    Then I enter text "Case that will cause processing error"
    Then Submit
    Then I see the text "Form Record Quarantined"
    Then I see the text "The server encountered an error processing your data."


