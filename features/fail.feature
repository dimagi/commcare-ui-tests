@Integration @2.34
Feature: Fail Tests

  Scenario: This should not be run
    # This should fail if its called - it should not be called
    Then I install the ccz app at "fail.ccz"
    Then I login with username "user_with_no_data" and password "123"
