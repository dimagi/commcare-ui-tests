Feature: Case Management
@Basic
Scenario: Create a case
	Then I install the app at "28OQrA2"
	Then I login with username "calabash" and password "auto"
	Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select module "Case Tests"
	Then I select module "Create a Case"
	Then I enter text "Saumya"
	Then Next
	Then I press "Confirm" button
	Then Next
	Then I select module "Update a Case"
	Then I select module "Saumya"






