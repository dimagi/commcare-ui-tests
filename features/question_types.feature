@Question_types
Feature: Question Types Form

Scenario: Basic Questions (minus dates)
	Then I install the ccz app at "question_types.ccz"
	Then I login with username "user_with_no_data" and password "123"
	Then I press start
	Then I select module "Question Types"
	And I select form "Basic Questions"

	Then I see the message "The following questions will go over basic question types allowed in a form" with a confirmation box.
	Then Next

	#Text
	Then I enter text "Test123$%^"
	Then Next

	#Integer
	Then I enter text "1234567890"
	Then Next

	#Decimal
	Then I enter text "1234567890"
	Then Next
	Then Prev
	Then I see the text "1.23456789E9"
	Then Next

	#Multi-select
	Then I select option from multi-select with text "One"
	Then I select option from multi-select with text "Two"
	Then I select option from multi-select with text "Three"

	Then I check that the "One" item in the multi-select list is selected
	Then I check that the "Two" item in the multi-select list is selected
	Then I check that the "Three" item in the multi-select list is selected
	Then Next

	#Single-select
	Then I select option from single-select with text "One"
	Then I check that the "One" item in the single-select list is selected
	Then I select option from single-select with text "Two"
	Then I check that the "Two" item in the single-select list is selected
	Then I check that the "One" item in the single-select list is not selected

	Then I select option from single-select with text "Three"
	Then I check that the "Three" item in the single-select list is selected
	Then I check that the "Two" item in the single-select list is not selected
	Then Next

	#Single-select Minimal
	Then I select the single-select dropdown list
	Then I select "Yes" from the single-select dropdown list
	Then I select the single-select dropdown list
	Then I select "No" from the single-select dropdown list
	
	Then I select the single-select dropdown list
	Then I select "" from the single-select dropdown list
	Then Next

	#Compact Single-Select
	#Don't want to do this using an index, but not sure how else to approach this 
	Then I press single-select image number "0"
	Then I check that single-select image number "0" is selected
	Then I press single-select image number "1"
	Then I check that single-select image number "1" is selected

	Then I press single-select image number "2"
	Then I check that single-select image number "2" is selected
	Then I press single-select image number "3"
	Then I check that single-select image number "3" is selected
	Then Next

	#Single-Select List
	#Don't want to do this using an index, but not sure how else to approach this
	Then I press single-select item number "0"
	Then I check that single-select item number "0" is selected
	Then I press single-select item number "1"
	Then I check that single-select item number "1" is selected

	Then I press single-select item number "2"
	Then I check that single-select item number "2" is selected
	Then I press single-select item number "3"
	Then I check that single-select item number "3" is selected	

	Then I press single-select item number "4"
	Then I check that single-select item number "4" is selected
	Then I press single-select item number "5"
	Then I check that single-select item number "5" is selected	

	Then Next

	#Phone Number/Numeric
	Then I enter text "000"
	Then Next
	Then Prev
	Then I see the text "000"

	Then Next

	#No confirmation box
	Then I see the message "You should only see this message. It should have no confirmation box" with no confirmation box.
	Then Next
	#Confirmation Box
	Then I see the message "You should be able to see this message and a confirmation box. The next set of questions will go over complex question types and will only be available on some devices." with a confirmation box.
	Then Next

	#Question List - Text
	Then I enter text "Test123$%^"
	Then Next
	
	#Question Lists - Multiple Choice
	Then I select option from multi-select with text "One"
	Then I select option from multi-select with text "Two"
	Then I select option from multi-select with text "Three"

	Then I check that the "One" item in the multi-select list is selected
	Then I check that the "Two" item in the multi-select list is selected
	Then I check that the "Three" item in the multi-select list is selected
	Then Next

	#Question List - Single Select
	Then I select option from single-select with text "One"
	Then I check that the "One" item in the single-select list is selected
	Then I select option from single-select with text "Two"
	Then I check that the "Two" item in the single-select list is selected
	Then I check that the "One" item in the single-select list is not selected

	Then I select option from single-select with text "Three"
	Then I check that the "Three" item in the single-select list is selected
	Then I check that the "Two" item in the single-select list is not selected
	Then Next

