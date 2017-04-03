@Languages
Feature: Languages

  Scenario: Ensure you can change languages in CommCare
    Then I install the ccz app at "languages.ccz"
    Then I login with username "user_with_no_data" and password "123"

   #Check that default language deployed
    Then I press start
    Then I select module "Basic Form Test"
    And I select form "Languages"

    Then I see the text "Enter a name:"
    Then I go back to the home screen

   #Change the language from home screen menu
    Then I select "Change Language" menu item
    Then I see the text "Hindi"
    Then I see the text "English"

   #Persists on rotation
    Then I rotate to landscape
    Then I see the text "Hindi"
    Then I see the text "English"

    Then I rotate to portrait
    Then I see the text "Hindi"
    Then I see the text "English"
    Then I press "Hindi"

   #Confirm the change
    Then I press start
    Then I select module "Basic Form Tests"
    And I select form "HIN: Languages"

    Then I select "Change Language" menu item
    Then I see the text "English"
    Then I see the text "Hindi"
    Then I press "English"

    Then I don't see the text "HIN: Enter a name"
    Then I see the text "Enter a name:"
    Then I exit form entry
    
   #Confirm application language remains the same
    Then I wait
    Then I select form "Hin: Languages"
    Then I go back to the home screen

  Scenario: Update test
   #Setting language on device to English
   #Seem to get logged out due to new scenario, so adding login steps.
    Then I login with username "user_with_no_data" and password "123"
    Then I select "Change Language" menu item
    Then I see the text "Hindi"
    Then I see the text "English"
    Then I press "English"

   #Updating to default language Hindi
    Then I update the app
    Then I apply the update
    Then I login with username "user_with_no_data" and password "123"

   #App should remain in English
    Then I press start
    Then I select module "Basic Form Tests"

    Then I don't see the text "HIN: Languages"
    Then I see the text "Languages"
