@SessionExpiration
Feature: User session expiration

  Scenario: Ensure form saves and redirect to login on session expiration
    Then I install the ccz app at "session_expiration.ccz"
    Then I login with username "user_with_no_data" and password "123"

      # check that session expiration redirects to login from the home screen
    Then I wait for 35 seconds
    Then I see the text "Log In"

      # check that session expiration redirects to login from the menu list
    Then I login with username "user_with_no_data" and password "123"
    Then I press start
    Then I wait for 35 seconds
    Then I see the text "Log In"

      # check that session expiration redirects to login from form entry
    Then I login with username "user_with_no_data" and password "123"
    Then I press start
    Then I select module "Basic"
    Then I select form "Session"
    Then Next
    Then I select option from single-select with text "2"
    Then I wait for 30 seconds
    Then I see the text "Log In"

      # check that session expiration saves a form as incomplete and re-opens in incomplete form view
    Then I login with username "user_with_no_data" and password "123", without waiting for completion
    Then I wait to see "Form Hierarchy"
    Then I see the text "Go To Start"
    Then I see the text "Select a color and proceed!"
    Then I see the text "2"

