Feature: Form Tests
@Form_Tests @QA
Scenario: Test incomplete form creation
	#Using language.ccz instead of ccqa.ccz. Issues with accessing Basic Form of ccqa.ccz. Should only need to change a few lines/words in the first 2 scenarios of this test if I can bypass that issue. 
	#Scenario covers Incomplete Forms 1 through 5
	Then I install the ccz app at "languages.ccz"
	Then I login with username "user_with_no_data" and password "123"
	#Create Incomplete Form
	Then I press start
	Then I select module "Basic Form Tests"
	Then I select module "Languages"
	Then I wait
	
	Then I save form as incomplete
	Then I wait to see "Start"
	Then I open incomplete forms
	Then I see the text "Languages"
	
	#Cancel Update of Incomplete form
	Then I press "Languages"
	Then I press "Go To Start"
	Then I wait
	#Press Enter a name to open keyboard
	Then I press "Enter a name:"
	Then I enter test
	Then I go back to the home screen
	
	Then I open incomplete forms
	Then I press "Languages"
	Then I press "Go To Start"
	Then I don't see the text "test"

	Then I wait
	Then I press "Enter a name:"
	Then I enter test
	Then I go back
	Then I save form as incomplete
	Then I wait
	
	Then I open incomplete forms
	Then I press "Languages"
	Then I press "Go To Start"
	Then I see the text "test"
	Then I exit form entry

Scenario: Save in form from menu
	#Incomplete Forms 6
	Then I login with username "user_with_no_data" and password "123"
	Then I press start

	Then I select module "Basic Form Tests"
	And I select form "Languages"

	Then I enter test
	Then I select "Save Form" menu item
	Then I go back to the home screen

	Then I wait
	Then I open incomplete forms
	Then I press "Languages"
	Then I press "Go To Start"

	Then I see the text "test"
	Then I go back to the home screen

Scenario: Form Entry Quirks
	# Form Entry Quirks 1
	Then I login with username "user_with_no_data" and password "123"
	Then I press start
	Then I select module "Basic Form Tests"
	And I select form "Constraint"

	Then Next
	Then I see the text "Sorry, this response is required!"
	Then I save form as incomplete
	Then I wait to see "Start"
	Then I open incomplete forms
	Then I see the text "Constraint"
	Then I go back to the home screen

#This should pass, but I can't get I toggle airplane mode to work. 
Scenario: Sync Tests
	Then I toggle airplane mode
	Then I login with username "user_with_no_data" and password "123"

	Then I open incomplete forms
	Then I press "Languages"
	Then I press "Go To Start"
	Then I see the text "test"
	Then Submit

	Then I see the text "Unsent Forms: 1"
	Then I logout
	Then I toggle airplane mode

	Then I login with username "clark" and password "123"
	Then I sync
	Then I don't see the text "Unsent Forms:"
	Then I see the text "You last synced with the server:"

	Then I open saved forms
	Then I see the text "Languages"
	Then I go back to the home screen

Scenario: Save case forms
	#Incomplete 7, Case Links 1 - 2b
	Then I login with username "clark" and password "123"
	Then I press start
	Then I select module "Case Tests"
	And I select module "Update a Case"

	Then I select case "Snow"
	Then I press the "Continue" button
	Then I wait
	Then I save form as incomplete
	Then I wait to see "Start"

	Then I press start
	Then I select module "Case Tests"
	And I select module "Update a Case"

	Then I select case "Snow"
	Then I press the "Continue" button
	Then I wait to see "Continue Form"
	Then I see the text "Delete old copy"
	Then I see the text "No"
	Then I see the text "Yes"
	Then I press the "No" button

	Then I select option from single-select with text "A"
	Then I save form as incomplete

	Then I wait to see "Start"
	Then I open incomplete forms
	Then I long press "Update a Case"
	
	Then I see the text "Open"
	Then I see the text "Delete Record"
	Then I see the text "Scan Record Integrity"
	Then I touch the "Delete Record" text

	Then I see the text "Update a Case"
	Then I go back to the home screen

	Then I press start
	Then I select module "Case Tests"
	And I select module "Update a Case"

	Then I select case "Snow"
	Then I press the "Continue" button
	Then I wait to see "Continue Form"
	Then I see the text "Delete old copy"
	Then I see the text "No"
	Then I see the text "Yes"
	Then I press the "Yes" button

	Then I press "Go To End"
	Then I see the text "Enter Anything Here:"
	Then I save form as incomplete
	Then I wait to see "Start"

	Then I open incomplete forms
	Then I see the text "Update a Case"






