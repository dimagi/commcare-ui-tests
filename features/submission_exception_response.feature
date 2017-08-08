@SubmissionExceptions @Integration
Feature: Test mobile handling of 422 response to form submission

#IllegalCaseId - update case in different domain from the form submission
#UsesReferrals - probably don't need to test this one as it's deprecated but if you really want to you can put a #'referral' block in a case update
#MissingProductId - only applies to old backend (couch) so probably not worth testing
#PhoneDateValueError - bad date format in case.date_modified
#InvalidCaseIndex - index to a case that doesn't exist
#CaseValueError - case value fails validation e.g. len(name) > 255

Scenario: Submit a form with a case name that is too long
	Then I install the ccz app at "integration_test_app.ccz"
	Then I login with username "test" and password "123"
	Then I press start
	Then I select module "Registration"
    Then I select form "Registration"
    Then I wait for form to load
    Then Next
    Then I enter text "This text will be a case name that is longer than 255 characters, which should trigger a CaseValueError when the form is submitted. This should cause HQ to return a 422 response code. I need to keep writing some more in order to make this longer than 255 characters. And some more."
    Then Next
    Then Next
    Then Submit
    Then I see the text "The server encountered an error processing your data"

Scenario: Submit a form with an index to a case that doesn't exist

	# Start with an app that uses parent/child cases
	Then I install the ccz app at "parent_child_app.ccz"

	# Create a few parent cases under user 'test' and then download the restore for that user (done outside of test)

	# AFTER restore is downloaded, delete 1 of those parent cases from HQ (done outside of test)

	# Do a custom restore from Developer Preferences with that restore file
	Then I select "Settings" menu item
	Then I touch the "Developer Options" text
	Then I touch the "Restore a custom user XML data file" text

	# Fill out child registration form against the deleted parent case