Feature: Basic Form Tests Module

@Basic
Scenario: Install the Basic Tests app and navigate to Basic Form Tests module
	Then I see the text "Welcome to CommCare!"
	Then I see the text "Please choose an installation method below"
	Then I install the app at "1rqucql"
	Then I login with username "vl1" and password "1234"
    Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select module "Basic Form Tests"

@Basic
Scenario: Test the Question Types form
	Then I select module "Question Types"
	Then I wait for form entry
	Then Next
	Then I enter text "William Pride"
	Then Next
	Then I enter text "12345"
	Then Next
	Then I enter text "123.456"
	Then Next
	Then Next
	Then Next