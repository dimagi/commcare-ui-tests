@Login
Feature: Login behavior

  Scenario: Test login logic: error handling, demo mode, and normal behavior
    Then I install the ccz app at "test_list_search.ccz"

      # normal login
    Then I login with username "user_with_no_data" and password "123"
      # TODO: consider counting the home screen buttons
    Then I verify that all home buttons are present
    Then I logout

      # login in landscape mode
      # which is way more annoying than portrait mode...
    Then I wait
    Then I clear input field number 2
    Then I clear input field number 1
    Then I close the keyboard
    Then I rotate to landscape
    Then I enter text "user_with_no_data"
    Then I close the keyboard
    Then I enter "123" into input field number 2
    Then I close the keyboard
    Then I press login
    Then I wait for progress

    Then I wait
    Then I verify that all home buttons are present
    Then I logout
    Then I rotate to portrait
    Then I wait

      # login in practice mode
    Then I select "Enter Practice Mode" menu item
    Then I wait for progress
    Then I wait to see "Starting Practice Mode"
    Then I rotate to landscape
    Then I wait to see "Starting Practice Mode"
    Then I rotate to portrait
    Then I wait
      # press the "OK" button in a round about way because it is semi-occluded
      # due to a bug I don't want to fix
    Then I press view with id "positive_button"
    Then I don't see the text "You are logging into"
    Then I verify that demo home buttons are present
    Then I logout

      # try logging in with bad password
    Then I login with username "user_with_no_data" and password "bad pass", without waiting for completion
    Then I wait for progress
    Then I see the text "Invalid Username or Password"

      # try logging in with bad username
    Then I login with username "fake user" and password "bad pass", without waiting for completion
    Then I wait for progress
    Then I see the text "Invalid Username or Password"

      # login offline
    Then I turn off the internet
    Then I login with username "user_with_no_data" and password "123"
    Then I verify that all home buttons are present
    Then I logout

      # try offline login with bad password
    Then I login with username "user_with_no_data" and password "bad pass", without waiting for completion

      # Check that you see "Either the password you entered was incorrect, or
      # CommCare couldn't reach the server"
    Then I wait up to 300 seconds to see "Either the password"

      # try offline login with bad username
    Then I login with username "fake user" and password "bad pass", without waiting for completion

      # Check that you see "Couldn't Reach Server. Please check your network
      # connection"
    Then I wait up to 300 seconds to see "Reach Server"

    Then I turn on the internet

    Then I clear input field number 2
    Then I press login
    Then I see the text "Empty Password"
