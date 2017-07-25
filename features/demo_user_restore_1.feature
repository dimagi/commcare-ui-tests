Feature: Offline demo user restore 1

Scenario: Log in as offline demo user 1
	Then I install the ccz app at "demo_user_test_1.ccz"
	Then I select "Enter Practice Mode" menu item
	# wait til we've been logged into practice mode
	Then I wait to see "Starting Practice Mode"
	Then I press view with id "positive_button" 
	Then I touch the "Explore CommCare Practice Mode" text
	Then I select module "Case List"
	Then I select module "Followup"
	Then I see a list that contains all of these items "alligator,animal,apple"