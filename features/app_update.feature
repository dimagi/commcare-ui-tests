Feature: App update test
@Integration
Scenario: Ensure app update can be obtained from HQ 
    Then I install the ccz app at "app_update.ccz"
    Then I login with username "test" and password "123"

    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "first module"
    And I select form "empty form"
    Then I wait for form entry
    Then I see the text "A label"
    Then I go back to the home screen

    Then I update the app
    Then I see the text "version 10"
    Then I apply the update
    Then I login with username "test" and password "123"

    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "first module"
    And I select form "empty form"
    Then I wait for form entry
    Then I see the text "An updated label"
    Then I go back to the home screen

    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "second module"
    And I select form "form with label"
    Then I see the text "first form in second module"
