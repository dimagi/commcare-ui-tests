Feature: Parent Cases
@ParentChild
Scenario: Create a case; add data to a case; view previous case data; don't cloes a case; close a case

	Then I install the ccz app at "basic.ccz"
	Then I login with username "parentchild" and password "123"
	Then I scroll until I see the "Start" text
	Then I press start
	Then I select module "Case Tests"
	Then I select form "Create a Case"
	Then I enter text "aParent"
	Then Next
	Then I press the "Confirm" button
	Then Next

	Then I wait for 5 seconds
	Then I select module "Update a Case"
	Then I select case "aParent"
	Then I wait for 3 seconds
	Then I go back
	Then I wait for 3 seconds
	Then I go back

	Then I select module "Create a Sub Case"
	Then I select case "aParent"
	Then I press the "Continue" button
	Then I press the "OK" button
	Then Next
	Then I enter text "dummy subcase"
	Then Next
	Then I enter text "2"
	Then Next
	Then I press the "Cancel" button
	Then Next
	
	Then I wait for 3 seconds
	Then I press start
	Then I select module "Case Tests"
	Then I select module "Create a Sub Case"
	Then I select case "aParent"
	Then I press the "Continue" button
	Then I press the "OK" button
	Then Next
	Then I enter text "asubcase"
	Then Next
	Then I enter text "2"
	Then Next
	Then I touch the "Confirm" text
	Then Next

	Then I wait for 3 seconds
	Then I press start
	Then I select module "Sub Case One"
	Then I select case "asubcase"
	Then I see "aParent"
	Then I press the "Continue" button
	Then I select form "Close Case"
	Then I press the "Yes" button
	Then Next

	Then I wait for 3 seconds
	Then I press start
	Then I select module "Sub Case One"
	Then I don't see "asubcase"
	Then I go back
	Then I wait for 3 seconds
	Then I select module "Case Tests"
	Then I select module "Create Multiple Sub Cases"
	Then I select case "aParent"
	Then I press the "Continue" button
	Then I enter text "sub case 1"
	Then Next
	Then I enter text "1"
	Then Next
	Then I enter text "sub case 2"
	Then Forward 2

	Then I wait for 3 seconds
	Then I press start
	Then I select module "Sub Case One"
	Then I scroll until I see the "sub case 1" text
	Then I select case "sub case 1"
	Then I see "aParent"
	Then I go back
	Then I wait for 3 seconds
	Then I go back
	Then I select module "Sub Case Two"
	Then I scroll until I see the "sub case 2" text
	Then I select case "sub case 2"
	Then I see "aParent"
	Then I go back
	Then I wait for 3 seconds
	Then I go back

	Then I select module "Case Tests"
	Then I select module "Close a Case"
	Then I select case "aParent"
	Then I press the "Continue" button
	Then I touch the "Confirm" text
	Then Next
	Then I wait for 5 seconds
	Then I don't see "aParent"

	Then I wait for 3 seconds
	Then I go back
	Then I wait for 3 seconds
	Then I go back
	Then I wait for 3 seconds
	Then I select module "Sub Case One"
	Then I scroll until I see the "sub case 1" text
	Then I select case "sub case 1"
	Then I press the "Continue" button
	Then I select form "Close Case"
	Then I press the "Yes" button
	Then Next

	Then I wait for 3 seconds	
	Then I press start
	Then I select module "Sub Case Two"
	Then I scroll until I see the "sub case 2" text
	Then I select case "sub case 2"
	Then I press the "Continue" button
	Then I select form "Close Case"
	Then I press the "Yes" button
	Then Next














	


