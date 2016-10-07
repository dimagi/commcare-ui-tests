Feature: Fixture Succeeds Test
  Scenario: Test that case sharing works properly
    Then I install the ccz app at "case_sharing.ccz"
    Then I login with username "case_sharing_1" and password "123"
    Then I press start
    Then I select module "Registration"
    Then I enter text "First Case"
    Then Next
    Then I enter text "1"
    Then Submit