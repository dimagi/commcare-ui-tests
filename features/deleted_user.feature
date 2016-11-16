Feature: Verify that a deleted user errors correctly

@Integration @2.29
Scenario: Create and restore a user, then delete and sync

	Then I create a user with name "tempuser"
	Then I install the ccz app at "integration_test_app.ccz"
	Then I login with username "tempuser" and password "Password123!"
