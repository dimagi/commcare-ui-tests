@DemoUserOnline
Feature: Offline demo user restore

Scenario: Use practice mode with a custom demo user
	
	# Enter practice mode
	Then I install the ccz app at "demo_user_test_1.ccz"
	Then I select "Enter Practice Mode" menu item
	Then I wait to see "Starting Practice Mode"
	Then I press view with id "positive_button"
	Then I scroll until I see the "Logged In: demo.user.test" text

	# Confirm that the right restore has been used
	Then I touch the "Explore CommCare Practice Mode" text
	Then I select module "Case List"
	Then I select module "Followup"
	Then I see a list that contains all of these items "alligator,animal,apple"

	# Create another case and check that it shows up in the case list
	Then I go back to the home screen
	Then I touch the "Explore CommCare Practice Mode" text
	Then I select module "Case List"
	Then I select form "Register"
	Then I enter text "carrot"
	Then Submit
	Then I wait
	Then I touch the "Explore CommCare Practice Mode" text
	Then I select module "Case List"
	Then I select module "Followup"
	Then I see a list that contains all of these items "alligator,animal,apple,carrot"

Scenario: Update to an app version with a different demo user and use that

	# Perform an update to an app version with a different demo user
	Then I login with username "test" and password "123"
	Then I do an offline update to the ccz app at "demo_user_test_2.ccz"

	# Enter Practice mode and check that the demo user has changed
	Then I select "Enter Practice Mode" menu item
	Then I wait to see "Starting Practice Mode"
	Then I press view with id "positive_button"
	Then I scroll until I see the "Logged In: demo.user.test.2" text
	Then I touch the "Explore CommCare Practice Mode" text
	Then I select module "Case List"
	Then I select module "Followup"
	Then I see a list that contains all of these items "balloon,block,bear"
