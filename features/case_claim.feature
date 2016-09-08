Feature: Claim a case

@Integration @2.29
Scenario: Create a case with one user, claim it with another
    # ensure 'cordelia' case isn't around, due to a test failure in the past
    Then I close case with name "cordelia"
    Then I install the ccz app at "case_claim.ccz"

    # create a case with one user
    Then I login with username "claim_test1" and password "123"
    Then I press start

    # make sure case doesn't already exist
    Then I select module "Follow Up"
    Then I don't see the text "cordelia"

    Then I go back to the home screen
    Then I press start

    Then I select form "Registration"
    Then I enter text "cordelia"
    Then Next
    Then I enter text "boston"
    Then Submit

    Then I sync

    # try to claim the case you just created
    Then I press start
    Then I select module "Follow Up"

    Then I scroll until I see the "SEARCH ALL" text
    Then I touch the "SEARCH ALL" text

    Then I enter text "cordelia"
    Then I touch the "Query" text
    Then I wait for progress
    Then I wait for the "EntitySelectActivity" screen to appear
    Then I touch the "cordelia" text
    Then I touch the "Continue" text
    # you are taken to the form list for that case
    Then I see the text "Close"

    # log in with another user
    Then I logout
    Then I login with username "claim_test2" and password "123"
    Then I press start

    Then I select module "Follow Up"
    Then I don't see the text "cordelia"

    Then I scroll until I see the "SEARCH ALL" text
    Then I touch the "SEARCH ALL" text

    Then I enter text "Steve"
    Then I touch the "Query" text

    # no results, so still on query screen:
    Then I wait for progress
    Then I see the text "Query"

    Then I clear input field number 1
    Then I enter text "cordelia"

    # This should move to the next prompt
    Then I press the enter button
    Then I enter text "boston"

    Then I touch the "Query" text
    Then I wait for progress

    # select the cordelia result
    Then I wait for the "EntitySelectActivity" screen to appear
    Then I touch the "cordelia" text
    Then I touch the "Continue" text

    # wait for claim and sync to occur
    Then I wait for progress

    # make sure the claimed case appears
    Then I select module "Follow Up"
    Then I see the text "cordelia"

    # close the claimed case
    Then I touch the "cordelia" text
    Then I touch the "Continue" text
    Then I select form "Close"

    # complete the case close form
    Then I touch the "Yes" text
    Then Next
    Then I enter text "Robot says bye"
    Then Submit

    # sync the case close form
    Then I sync
    Then I logout

    # login with first user, sync and make sure the case is no longer around
    Then I login with username "claim_test1" and password "123"
    Then I wait to see "Sync"
    Then I sync

    Then I press start

    Then I select module "Follow Up"
    Then I don't see the text "cordelia"
