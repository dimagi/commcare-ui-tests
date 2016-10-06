Feature: Languages
@QA @Languages
Scenario: Ensure you can change languages in CommCare
	Then I install the ccz app at "languages.ccz"
	Then I login with username "clark" and password "123"

	#Check that default language deployed
	Then I press start
	Then I select module "Basic Form Test"
	And I select form "Languages"

	Then I see the text "Enter a name:"
	Then I enter text "English"
	Then Submit
	Then I go back to the home screen

	#Change the language from home screen menu
	Then I select "Change Language" menu item
	Then I see the text "Hindi"
	Then I press "Hindi"

	#Confirm the change 
	Then I press start
	Then I select module "Basic Form Tests"
	Then I select form "HIN: Languages"

	Then I see the text "HIN: Enter a name:"
	Then I enter text "Hindi"
	Then Submit
	#This step might be unnecessary or I could use I wait. Couldn't get the test to pass without this step, though. 
	Then I go back to the home screen

	#Change Language in Form
	Then I press start
	Then I select module "Basic Form Tests"
	And I select form "HIN: Languages"

	Then I select "Change Language" menu item
	Then I see the text "en"
	Then I press "en"

	Then I don't see the text "HIN: Enter a name"
	Then I see the text "Enter a name:"
	Then I enter text "English"
	Then Submit

	#Confirm application language remains the same
	Then I wait
	Then I press start
	Then I select module "Basic Form Tests"
	Then I select form "Hin: Languages"
	Then I see the text "Hin: Enter a name"
	Then I enter text "test passes"

