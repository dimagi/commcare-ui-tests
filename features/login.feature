Feature: Login behavior
@QA
Scenario: Ensure login shows proper error messages
    Then I install the ccz app at "test_list_search.ccz"

    # normal login
    Then I login with username "user_with_no_data" and password "123"
    # TODO: consider counting the home screen buttons
    Then I logout

    # login in portrait mode
    Then I rotate to portrait
    Then I close the keyboard
    Then I login with username "user_with_no_data" and password "123"
    # TODO: consider counting the home screen buttons
    Then I logout
    Then I rotate to landscape

    # login in demo mode
    Then I select "Enter as Demo User" from the menu
    Then I wait for progress
    Then I wait to see "Starting Demo Mode"
    Then I rotate to landscape
    Then I wait to see "Starting Demo Mode"
    Then I rotate to portrait
    Then I touch the "OK" text
    Then I logout

    # login offline
    Then I toggle airplane mode
    Then I login with username "user_with_no_data" and password "123"
    Then I logout

    Then I login with username "user_with_no_data" and password "bad pass", without waiting for completion
    Then I see the text "Either the password"

    Then I login with username "fake user" and password "bad pass", without waiting for completion
    Then I see the text "Couldn't Reach Server"

    Then I toggle airplane mode
    Then I login with username "fake user" and password "bad pass"
    Then I wait for progress
    Then I see the text "Invalid Username or Password"