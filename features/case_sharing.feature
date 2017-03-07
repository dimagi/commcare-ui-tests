@CaseSharing
Feature: Case Sharing Features

  Scenario: Obtain a clean environment
    Then I install the ccz app at "case_sharing.ccz"
    Then I login with username "case_sharing_1" and password "123"

      # Submit the cleanup form, which should close out any lingering cases.
    Then I press start
    Then I select module "Test Cleanup"
    Then Submit

      # Make sure that no cases are left after the clear
    Then I press start
    Then I select module "Follow Up"
    Then I don't see the text "First Case"
    Then I don't see the text "Second Case"
    Then I sync


  Scenario: Create a case with user 1
    Then I login with username "case_sharing_1" and password "123"

    Then I press start
    Then I select module "Registration"
    Then I enter text "First Case"
    Then Next
    Then I enter text "1"
    Then Submit
    Then I sync

      # validate that case was created
    Then I press start
    Then I select module "Follow Up"
    Then I see the text "First Case"
    Then I touch the "First Case" text

  Scenario: Create a case with user 2, and update user 1 case
    Then I login with username "case_sharing_2" and password "123"
    Then I press start
    Then I select module "Registration"
    Then I enter text "Second Case"
    Then Next
    Then I enter text "2"
    Then Submit

    Then I press start
    Then I select module "Follow Up"
    Then I see the text "First Case"
    Then I touch the "First Case" text
    Then I see the text "1"
    Then I touch the "Continue" text
    Then I select module "Visit"
    Then Next
    Then I see the text "1"
    Then I enter text "2"
    Then Submit
    Then I sync

  Scenario: Receive User 2 changes and close cases
    Then I login with username "case_sharing_1" and password "123"
    Then I sync
    Then I press start
    Then I select module "Follow Up"
    Then I see the text "First Case"
    Then I see the text "Second Case"
    Then I touch the "First Case" text
    Then I see the text "12"
    Then I touch the "Continue" text
    Then I select module "Close"
    Then Submit

    Then I press start
    Then I select module "Follow Up"
    Then I don't see the text "First Case"
    Then I see the text "Second Case"
    Then I touch the "Second Case" text
    Then I see the text "2"
    Then I touch the "Continue" text
    Then I select module "Close"
    Then Submit
    Then I sync

  Scenario: Validate all cases closed
    Then I login with username "case_sharing_2" and password "123"
    Then I sync
    Then I press start
    Then I select module "Follow Up"
    Then I don't see the text "First Case"
    Then I don't see the text "Second Case"


