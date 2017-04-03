@FormSettings
Feature: Test all form entry settings

  Scenario: Test the 'Save Form' setting

    Then I install the ccz app at "settings_sheet_tests.ccz"
    Then I login with username "settings.test" and password "123"
    Then I press start
    Then I select module "Basic Form Tests"
    Then I select form "Question Types"

    Then Next
    Then I enter text "Test Value 123"
    Then I select "Save Form" menu item
    Then I exit form entry
    Then I go back to the home screen

   # Check that the form saved as incomplete and that it contains the text that was entered
    Then I see the text "Incomplete (1)"
    Then I open incomplete forms
    Then I open the incomplete form with title "Question Types"
    Then Next
    Then I see the text "Test Value 123"

  Scenario: Test the 'Go To Prompt' setting

    Then I login with username "settings.test" and password "123"
    Then I press start
    Then I select module "Basic Form Tests"
    Then I select form "Question Types"

    Then I select "Go To Prompt" menu item
    Then I see the text "Go Up"
    Then I see the text "Go To Start"
    Then I see the text "Go To End"
    Then I touch the "Go To End" text
    Then I see the text "FINISH"

  Scenario: Test the 'Text Size' setting

    Then I login with username "settings.test" and password "123"
    Then I press start
    Then I select module "Basic Form Tests"
    Then I select form "Question Types"

    Then I select "Change Settings" menu item
    Then I touch the "Text Font Size" text
    Then I touch the "Extra Small" text
    Then I go back
    Then I wait

   # IMPORTANT: Part of completing QA must be for a human to view this screenshot and confirm that the text is very small
    Then take picture
    Then I rename file "screenshot_0.png" to "form_settings_tests-extra_small_font.png"

    Then I select "Change Settings" menu item
    Then I touch the "Text Font Size" text
    Then I touch the "Extra Large" text
    Then I go back
    Then I wait

   # IMPORTANT: Part of completing QA must be for a human to view this screenshot and confirm that the text is very large
    Then take picture
    Then I rename file "screenshot_1.png" to "form_settings_tests-extra_large_font.png"

   # Set the font back to normal
    Then I select "Change Settings" menu item
    Then I touch the "Text Font Size" text
    Then I touch the "Medium" text

  Scenario: Test the 'Change Language' setting

    Then I login with username "settings.test" and password "123"
    Then I press start
    Then I select module "Basic Form Tests"
    Then I select form "Question Types"

    Then I select "Change Language" menu item
    Then I see a list that contains all of these items "English,हिंदी"
    Then I touch the "हिंदी" text
    Then I see the text "HINDI TRANSLATION"

    Then I select "Change Language" menu item
    Then I see a list that contains all of these items "English,हिंदी"
    Then I touch the "English" text
    Then I don't see the text "HINDI TRANSLATION"
