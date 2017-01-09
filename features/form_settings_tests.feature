@FormSettings
Feature: Test all form entry settings

@AWS
Scenario: Test the 'Change Language' setting

	Then I install the ccz app at "settings_sheet_tests.ccz"
	Then I login with username "settings.test" and password "123"
	Then I press start
	Then I select module "Basic Form Tests"
	Then I select form "Question Types"

	Then I select "Change Language" menu item
	Then I see a list that contains all of these items "English,Hindi"
	Then I touch the "Hindi" text
	Then I see the text "HINDI TRANSLATION"

	Then I select "Change Language" menu item
	Then I see a list that contains all of these items "English,Hindi"
	Then I touch the "English" text
	Then I don't see the text "HINDI TRANSLATION"