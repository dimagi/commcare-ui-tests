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
	Then I press the "Confirm" button
	Then Next

	Then I select case "Update a Case"
	Then I select case "aSaumya"
	Then I press the "Continue" button
	Then I enter text "Sample Text"
	Then Next
	Then I touch the "A" text
	Then Next
	Then I touch the "A" text
	Then I touch the "B" text
	Then Next
	Then I enter text "7732024343"
	Then Next
	Then I enter text "1234"
	Then Forward 3
	Then I press the "OK" button
	Then Next

	Then I select module "aSaumya"
	Then I see "aSaumya"
	Then I rotate to landscape
	Then I rotate to portrait
	Then I go back
	Then I go back

	Then I select case "Close a Case"
	Then I select module "aSaumya"
	Then I press the "Continue" button
	Then I press the "Cancel" button
	Then Next

	Then I select module "aSaumya"
	Then I press the "Continue" button
	Then I press the "Confirm" button
	Then Next
	Then I wait for 3 seconds
	Then I go back