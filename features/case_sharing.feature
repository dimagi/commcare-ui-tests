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
    # validate that case was created
    Then I press start
    Then I select module "Follow Up"
    Then I see the text "First Case"
    Then I touch the "First Case" text
    Then I logout

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
    Then I logout

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
    Then I logout

    Then I login with username "case_sharing_2" and password "123"
    Then I sync
    Then I press start
    Then I select module "Follow Up"
    Then I don't see the text "First Case"
    Then I don't see the text "Second Case"


