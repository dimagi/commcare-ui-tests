Feature: Claim a case
@Integration
Scenario: Create a case with one user, claim it with another
    Then I install the ccz app at "case_claim.ccz"

    # create a case with one user
    Then I login with username "test" and password "123"
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text
    Then I select module "Pregnancy"
    Then I select module "Registration"
    Then I wait for form entry
    Then I enter text "luca"
    Then Next
    Then I enter text "boston"
    Then Next
    Then Next
    Then Next
    Then Next
    Then Next
    Then Submit

    # Sync the case creation form and logout
    Then I wait to see "Sync"
    Then I touch the "Sync" text
    Then I wait for progress
    Then I scroll down
    Then I logout

    # log in with another user
    Then I login with username "fp" and password "test"
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "Visit"
    Then I don't see the text "luca"

    Then I scroll until I see the "Global Search" text
    Then I touch the "Global Search" text

    Then I enter text "Steve"
    Then I touch the "Query" text

    # no results, so still on query screen:
    Then I wait for progress
    Then I see the text "Query"

    Then I clear input field number 1
    Then I enter text "luca"

    # This should move to the next prompt
    #press_user_action_button('search')
    Then I press the enter button
    Then I enter text "boston"

    Then I touch the "Query" text

    # select the luca result
    Then I wait for the "EntitySelectActivity" screen to appear
    Then I touch the "luca" text
    Then I touch the "Continue" text

    # wait for claim and sync to occur
    Then I wait for progress

    # make sure the claimed case appears
    Then I select module "Visit"
    Then I see the text "luca"

    # close the claimed case
    Then I touch the "luca" text
    Then I touch the "Continue" text
    Then I select module "Copy of Birth Outcome"

    # complete the case close form
    Then I wait for form entry
    Then I touch the "Live Birth" text
    Then Next
    Then Next
    Then I enter text "Ivan"
    Then Next
    Then Submit

    # sync the case close form
    Then I wait to see "Sync"
    Then I touch the "Sync" text
    Then I wait for progress
    Then I scroll down
    Then I logout

    # login with first user, sync and make sure the case is no longer around
    Then I login with username "test" and password "123"
    Then I wait to see "Sync"
    Then I touch the "Sync" text
    Then I wait for progress

    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "Visit"
    Then I don't see the text "luca"