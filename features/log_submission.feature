Feature: Log Submission

  @Integration @2.39
  Scenario: Logs get submitted successfully
    Then I install the ccz app at "integration_test_app.ccz"
    Then I login with username "test" and password "123"
    Then I select "Advanced" menu item
    Then I start "UITestInfoActivity" activity with extras "--ei info_type 1"
    Then I see the text "2 logs to submit"
    Then I go back
    Then I start "UITestInfoActivity" activity with extras "--ei info_type 1"
    Then I see the text "3 logs to submit"
    Then I go back
    Then I press "Force Log Submission"
    Then I wait for 40 seconds
    Then I start "UITestInfoActivity" activity with extras "--ei info_type 1"
    Then I see the text "1 logs to submit"