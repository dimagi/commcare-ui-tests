Feature: Simprints (case-list) callout tests

Scenario: Ensure registration and search callouts to (fake) simprints app work
    Then I uninstall the "com.dimagi.test.external" apk app
    Then I install the "tester" apk

    Then I install the ccz app at "fingerprinting.ccz"

    Then I login with username "test" and password "123"

    # create a case
    Then I press start
    Then I select form "Registration"
    Then I enter text "2"
    Then I touch the "Get Data" text
    Then I wait for 1 second
    Then I see the text "Update Data"
    Then Next
    Then I enter text "Lonny"
    Then Submit

    Then I press start
    Then I select module "Follow Up"

    # check the column header text
    Then I see the text "Name"

    # make the search callout
    Then I press view with id "barcode_scan_action_bar"

    # make sure the header is still there
    Then I see the text "Name"
    Then I see the text "results matching"

    # make sure data persists on rotation and forward nav
    Then I rotate to landscape
    Then I rotate to portrait
    Then I see the text "results matching"
    Then I press list item number 1
    Then I wait for 1 second
    Then I go back
    Then I see the text "results matching"

    # clear the search results
    Then I press view with id "clear_search_button"
    Then I don't see the text "results matching"

    Then I press view with id "barcode_scan_action_bar"

    Then I press list item number 1
    Then I touch the "Continue" text
    Then I select form "Visit"

    # check that we correctly tracked the callout
    Then I see the text "Was callout query"

    Then I go back to the home screen
    Then I press start
    Then I select module "Follow Up"
    # check that we correctly tracked the text search
    Then I press view with id "search_action_bar"
    Then I enter text "nny"
    Then I press list item number 1
    Then I touch the "Continue" text
    Then I select form "Visit"

    # check that we correctly tracked the text search
    Then I see the text "Was string query"
    Then I exit form entry

    # close the case
    Then I select form "Close"
    Then Next
    Then I enter text "auto"
    Then Submit

    # test auto-launching the search callout
    Then I press start
    Then I select module "auto-launch"
    Then I see the text "results matching"
    Then I see the text "Name"
    Then I see the text "Result"
