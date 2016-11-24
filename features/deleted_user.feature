Feature: Verify that syncing with a deleted user errors correctly

@Integration @2.31
Scenario: Create and restore a user, then delete and sync

	Then I create a user with name "tempuser" and password "Password123!"
	Then I install the ccz app at "integration_test_app.ccz"
	Then I login with username "tempuser" and password "Password123!"
	Then I delete the user with name "tempuser"
	Then I sync
	Then I see the text "Your account has been deleted"