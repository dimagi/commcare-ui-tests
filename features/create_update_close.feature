Feature: Case Management
@Basic
Scenario: Create a case, update a case, close a case	

	Then I install the app at "28OQrA2"
	Then I login with username "calabash" and password "auto"
	Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select case "Case Tests"
	Then I select case "Create a Case"
	Then I enter text "aSaumya"
	Then Next
	Then I press "Confirm" button
	Then Next

	Then I select case "Update a Case"
	Then I select case "aSaumya"
	Then I press "Continue" button
	Then I enter text "Sample Text"
	Then Next
	Then I press "A" button
	Then Next
	Then I press "A" button
	Then I press "B" button
	Then Next
	Then I enter text "7732024343"
	Then Next
	Then I enter text "1234"
	Then Next
	Then Next
	Then Next
	Then I press "OK" button
	Then Next

	Then I select module "aSaumya"
	Then I look for "aSaumya"
	Then I flip to landscape
	Then Rotate Portrait
	Then I go back
	Then I go back

	Then I select case "Close a Case"
	Then I select module "aSaumya"
	Then I press "Continue" button
	Then I press "Cancel" button
	Then Next

	Then I select module "aSaumya"
	Then I press "Continue" button
	Then I press "Confirm" button
	Then Next
	Then I sleep 3 seconds
	Then I go back