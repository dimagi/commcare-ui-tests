Feature: Case Management
@Basic
Scenario: Create a case; add data to a case; view previous case data; don't cloes a case; close a case

	Then I install the app at "28OQrA2"
	Then I login with username "calabash" and password "auto"
	Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select case "Case Tests"
	Then I select case "Create a Case"
	Then I enter text "aParent"
	Then Next
	Then I press "Confirm" button
	Then Next

	Then I sleep 5 seconds
	Then I select case "Update a Case"
	Then I select module "aParent"
	Then I sleep 3 seconds
	Then I go back
	Then I sleep 3 seconds
	Then I go back

	Then I select case "Create a Sub Case"
	Then I select module "aParent"
	Then I press the "Continue" button
	Then I press the "OK" button
	Then Next
	Then I enter text "dummy subcase"
	Then Next
	Then I enter text "2"
	Then Next
	Then I press the "Cancel" button
	Then Next
	
	Then I sleep 3 seconds
	Then I touch the "Start" text
	Then I select case "Case Tests"
	Then I select case "Create a Sub Case"
	Then I select module "aParent"
	Then I press the "Continue" button
	Then I press the "OK" button
	Then Next
	Then I enter text "asubcase"
	Then Next
	Then I enter text "2"
	Then Next
	Then I press the "Confirm" button
	Then Next

	Then I sleep 3 seconds
	Then I touch the "Start" text
	Then I select case "Sub Case One"
	Then I select module "asubcase"
	Then I see "aParent"
	Then I press the "Continue" button
	Then I select case "Close Case"
	Then I press the "Yes" button
	Then Next

	Then I sleep 3 seconds
	Then I touch the "Start" text
	Then I select case "Sub Case One"
	Then I don't see "asubcase" is not present
	Then I go back
	Then I sleep 3 seconds
	Then I select case "Case Tests"
	Then I select case "Create Multiple Sub Cases"
	Then I select module "aParent"
	Then I press the "Continue" button
	Then I enter text "sub case 1"
	Then Next
	Then I enter text "1"
	Then Next
	Then I enter text "sub case 2"
	Then Forward 2

	Then I sleep 3 seconds
	Then I touch the "Start" text
	Then I select case "Sub Case One"
	Then I scroll until I see the "sub case 1" text
	Then I select module "sub case 1"
	Then I see "aParent"
	Then I go back
	Then I go back
	Then I select case "Sub Case Two"
	Then I scroll until I see the "sub case 2" text
	Then I select module "sub case 2"
	Then I see "aParent"
	Then I go back
	Then I go back

	Then I select case "Case Tests"
	Then I select case "Close a Case"
	Then I select module "aParent"
	Then I press the "Continue" button
	Then I press the "Confirm" button
	Then Next
	Then I sleep 3 seconds
	Then I dont' see "aParent"

	Then I sleep 3 seconds
	Then I go back
	Then I sleep 3 seconds
	Then I go back
	Then I sleep 3 seconds
	Then I select case "Sub Case One"
	Then I scroll until I see the "sub case 1" text
	Then I select module "sub case 1"
	Then I press the "Continue" button
	Then I select case "Close Case"
	Then I press the "Yes" button
	Then Next

	Then I sleep 3 seconds
	Then I touch the "Start" text
	Then I select case "Sub Case Two"
	Then I scroll until I see the "sub case 2" text
	Then I select module "sub case 2"
	Then I press the "Continue" button
	Then I select case "Close Case"
	Then I press the "Yes" button
	Then Next














	


