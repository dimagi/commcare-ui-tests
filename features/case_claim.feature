Feature: Claim a case
@Integration
Scenario: Create a case with one user, claim it with another
    Then I install the ccz app at "case_claim.ccz"

    # create a case with one user
    Then I login with username "test" and password "123"
    Then I press start

    # make sure case doesn't already exist
    Then I select module "Visit"
    Then I don't find the text "karen"

    Then I go back to the home screen
    Then I press start

    Then I select module "Pregnancy"
    Then I select module "Registration"
    Then I wait for form entry
    Then I enter text "karen"
    Then Next
    Then I enter text "boston"
    Then Forward 5
    Then Submit

    Then I sync

    # try to claim the case you just created
    Then I press start
    Then I select module "Visit"

    Then I scroll until I see the "Global Search" text
    Then I touch the "Global Search" text

    Then I enter text "karen"
    Then I touch the "Query" text
    Then I wait for the "EntitySelectActivity" screen to appear
    Then I touch the "karen" text
    Then I touch the "Continue" text
    Then I see the text "Start"

    # log in with another user
    Then I logout
    Then I login with username "fp" and password "test"
    Then I press start

    Then I select module "Visit"
    Then I don't see the text "karen"

    Then I scroll until I see the "Global Search" text
    Then I touch the "Global Search" text

    Then I enter text "Steve"
    Then I touch the "Query" text

    # no results, so still on query screen:
    Then I wait for progress
    Then I see the text "Query"

    Then I clear input field number 1
    Then I enter text "karen"

    # This should move to the next prompt
    Then I press the enter button
    Then I enter text "boston"

    Then I touch the "Query" text

    # select the karen result
    Then I wait for the "EntitySelectActivity" screen to appear
    Then I touch the "karen" text
    Then I touch the "Continue" text

    # wait for claim and sync to occur
    Then I wait for progress

    # make sure the claimed case appears
    Then I select module "Visit"
    Then I see the text "karen"

    # close the claimed case
    Then I touch the "karen" text
    Then I touch the "Continue" text
    Then I select module "Copy of Birth Outcome"

    # complete the case close form
    Then I wait for form entry
    Then I touch the "Live Birth" text
    Then Forward 2
    Then I enter text "Ivan"
    Then Next
    Then Submit

    # sync the case close form
    Then I sync
    Then I logout

    # login with first user, sync and make sure the case is no longer around
    Then I login with username "test" and password "123"
    Then I wait to see "Sync"
    Then I touch the "Sync" text
    Then I wait for progress

    Then I press start

    Then I select module "Visit"
    Then I don't find the text "karen"
