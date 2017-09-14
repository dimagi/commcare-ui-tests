@LogSubmission
Feature: Log Submission

  Scenario: Logs get submitted successfully
    Then I install the ccz app at "integration_test_app.ccz"
    Then I login with username "test" and password "123"
    Then I press start
    Then I select module "Errors"
    Then I select module "Error on open"
    Then I see the text "Error Occurred"
    Then I go back to the home screen
    Then I select "Advanced" menu item
    Then I press "Force Log Submission"
    Then I wait for 30 seconds
    Then I start "UITestInfoActivity" activity with extras "-e info_type log_submission"
    Then I see the text "Logs successfully submitted"
