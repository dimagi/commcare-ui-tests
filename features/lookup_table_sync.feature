Feature: Lookup Table Update

  @Integration
  Scenario: Ensure lookup table changes are pulled on sync
    Then I upload the "initial_cities_table.xlsx" lookup table
    Then I install the ccz app at "integration_test_app.ccz"
    Then I login with username "test" and password "123"
    Then I wait for 60 seconds
    Then I touch the "Sync" text
    Then I wait for progress
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text
    Then I select module "Misc"
    And I select form "Lookup Tables"
    Then I see 1 select options
    Then I upload the "extended_cities_table.xlsx" lookup table
    Then I wait for 60 seconds
    Then I go back to the home screen
    Then I touch the "Sync" text
    Then I wait for progress
    Then I touch the "Sync" text
    Then I wait for progress
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text
    Then I select module "Misc"
    And I select form "Lookup Tables"
    Then I see 7 select options
