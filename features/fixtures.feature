Feature: Fixture Failure Test
  Scenario: Ensure that we error cleanly when missing a fixture
    Then I install the ccz app at "fixtures.ccz"
    Then I login with username "fixtures_fails" and password "123"
    Then I press start
    Then I select module "Fixtures"
    Then I select module "Fixtures Form"
    Then I wait for form entry
    Then Next
    # Should error
    Then I should see "Error Occurred"
    Then I should see "XPath evaluation"

  Scenario: Ensure that fixtures work correctly
    