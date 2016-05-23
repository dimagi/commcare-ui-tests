Feature: Basic Form Tests Module

@Basic
Scenario: Test all forms in the Basic Form Tests module of the Basic Tests app

	# Install the Basic Tests app and navigate to the Basic Form Tests module
	Then I see the text "Welcome to CommCare!"
	Then I see the text "Please choose an installation method below"
	Then I install the app at "1rqucql"
	Then I login with username "vl1" and password "1234"
    Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select module "Basic Form Tests"

	# Test the Question Types form
	Then I select module "Question Types"
	Then I wait for form entry
	Then Next
	Then I enter text "William Pride"
	Then Next
	Then I enter text "12345"
	Then Next
	Then I enter text "123.456"
	Then Next
	# Skipping date questions for now
	Then Next
	Then Next
	Then I see 3 select options in a multi-select
	Then I select option from multi-select with text "Two"
	Then Next
	Then I see 3 select options in a single-select
	Then I select option from single-select with text "Three"
	Then Next
	Then I see a compact single-select widget with row labels "Red,Green,Yellow" and options "Yes,No"
	Then Next

	# Test the Groups form
	#Then I select module "Groups"
	#Then I wait for form entry
	#Then Next