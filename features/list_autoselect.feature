@AutoSelect
Feature: Autoselect
  Scenario: Install app 
    Then I install the ccz app at "list_autoselect.ccz"

  Scenario: Before form, with detail

    Then I login with username "list_autoselect_test" and password "123"
    Then I scroll until I see the "Start" text
    Then I press start

    Then I wait to see "Before Form: With Detail"
    Then I touch the "Before Form: With Detail" text

    Then I wait to see "standalone"
    Then I touch the "Continue" text

    Then I wait to see "Placeholder: Form Visible"    

    Then I go back
    Then I wait to see "Exit Form?"
    Then I touch the "EXIT WITHOUT SAVING" text

    Then I wait to see "standalone"
    Then I don't see "Placeholder: Form Visible"

  Scenario: Before form, no detail

    Then I login with username "list_autoselect_test" and password "123"
    Then I scroll until I see the "Start" text
    Then I press start

    Then I wait to see "Before Form: No Detail"
    Then I touch the "Before Form: No Detail" text

    Then I wait to see "Placeholder: Form Visible"

    Then I go back
    Then I wait to see "Exit Form?"
    Then I touch the "EXIT WITHOUT SAVING" text

    Then I wait to see "Test: List Autoselect"
    Then I don't see "Placeholder: Form Visible"

