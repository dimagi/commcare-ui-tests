Feature: Case Management
@CaseMgmt
Scenario: Create a case, update a case, close a case	

	# Create case
	Then I install the ccz app at "basic.ccz"
	Then I login with username "cases" and password "123"
	Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select module "Case Tests"
	Then I select form "Create a Case"
	Then I enter text "Batman"
	Then Next
	Then I press the "Confirm" button
	Then Submit
	# Confirm that case was created and case list is correct
	Then I select module "Update a Case"
 	# The step definition Then I select the "Update a Case" module wasn't working for me
	Then I see the text "Name"
	Then I see the text "Date Opened"
	Then I see the text "Status"
	Then I select case "Batman"
	# Confirm case details
	Then I see the text "Name"
	Then I see the text "Date Opened"
	Then I see the text "Status"
	Then I touch the "Continue" text
	# Update case
	Then I enter text "Batman Text"
	Then Next
	Then I touch the "A" text
	Then Next
	Then I touch the "A" text
	Then I touch the "B" text
	Then Next
	Then I enter text "6789"
	Then Next
	Then I enter text "1234"
	Then Forward 3
	Then Submit
	# Confirm details updated
	Then I select case "Batman"
	Then I see the text "Batman"
	Then I see the text "Text"
	Then I see the text "Phone Number"
	Then I see the text "6789"
	# Confirm that tabs work
	Then I see the text "Case Details 2"
	Then I touch the "Case Details 2" text
	Then I see the text "Singleselect"
	Then I see the text "Multiselect"
	Then I see the text "1234"

	Then I rotate to landscape
	Then I rotate to portrait

	Then I see the text "Batman"
	Then I see the text "Text"
	Then I see the text "Phone Number"
	Then I see the text "6789"

	# Confirm that calling works (kind of)
	Then I touch the "6789" text
	Then I see the text "Call"
	Then I see the text "Send SMS"
	# Hitting back too quickly in succession stopped registering
	Then I go back
	Then I wait for 2 seconds
	Then I go back
	Then I wait for 1 second
	Then I go back
	# Test NOT closing case
	Then I select module "Close a Case"
	Then I select case "Batman"
	Then I press the "Continue" button
	Then I press the "Cancel" button
	Then Submit
	# Test closing case
	Then I select case "Batman"
	Then I press the "Continue" button
	Then I press the "Confirm" button
	Then Submit
	Then I wait for 3 seconds
	Then I don't see the text "Batman"

