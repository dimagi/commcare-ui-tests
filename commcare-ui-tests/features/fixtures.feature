Feature: Fixtures

  @QA
  Scenario: Ensure that we error cleanly when missing a fixture
    Then I install the ccz app at "fixtures.ccz"
    Then I login with username "fixtures_fails" and password "123"
    Then I press start
    Then I select module "Fixtures"
    Then I select form "Fixtures Form"
    Then I wait for form entry
    Then Next
    # Should error
    Then I should see "Error Occurred"
    Then I should see "XPath evaluation"

  @QA
  Scenario: Ensure that we can use fixtures correctly, and that fixtures work in saved forms
    Then I login with username "fixtures_works" and password "123"
    Then I press start
    Then I select module "Fixtures"
    Then I select form "Fixtures Form"
    Then I wait for form entry
    Then Next
    Then I toggle checkbox number 1
    Then I toggle checkbox number 2
    Then Next
    Then I touch the "Essex" text
    Then Next
    Then I touch the "Saugus" text
    Then Submit
    Then I go to Saved Forms
    Then I press list item number 1
    Then I should see "3 3"
    Then I should see "Essex"
    Then I should see "Saugus"

  @QA
  Scenario: Ensure that fixture filtering works
    Then I login with username "fixtures_works" and password "123"
    Then I press start
    Then I select module "Fixtures"
    Then I select form "Fixtures Form"
    Then I wait for form entry
    Then Next
    Then I toggle checkbox number 1
    Then I toggle checkbox number 2
    Then Next
    Then Next
    Then I see 0 select options
    Then Prev

    Then I touch the "Essex" text
    Then Next
    Then I should see "Saugus"
    Then I should see "Andover"
    Then Prev

    Then I touch the "Middlesex" text
    Then Next
    Then I should see "Cambridge"
    Then I should see "Wilmington"
    Then I should see "Billerica"
    Then Prev

    Then I touch the "Suffolk" text
    Then Next
    Then I should see "Boston"
    Then I should see "Winthrop"

    Then I touch the "Boston" text
    Then Submit

  @QA
  Scenario: Ensure that 1MB Fixtures Work
    Then I login with username "fixtures_1MB" and password "123"
    Then I press start
    Then I select module "Fixtures"
    Then I select form "1MB Fixture"
    Then I wait for form entry
    Then Next
    Then I should see "Please select an option"
    Then I touch the "Increase Enalapril" text
    Then Submit
