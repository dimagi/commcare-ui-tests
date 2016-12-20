@Setup
Feature: The Setup Screen
@AWS
Scenario: The setup screen is correct
	Then I see the text "Welcome to CommCare!"
	Then I see the text "Please choose an installation method below"
	Then I install the app at "1rqucql"
	Then I login with username "test" and password "1234"
    Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select module "Basic Form Tests"
	Then I select form "Question Types"
	Then Next
	Then I enter text "William Pride"
	Then Next
	Then I enter text "12345"
	Then Next
	Then I enter text "123.456"
	Then Next
	Then Next
	Then Next
