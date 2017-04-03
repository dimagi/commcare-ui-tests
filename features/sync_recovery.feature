Feature: Perform 412 Recovery Sync

  @Integration
  Scenario: Make sure recovery syncs work
    Then I install the ccz app at "case_claim.ccz"

      # create a case with one user
    Then I login with username "test" and password "123"
    Then I press start

      # count cases
    Then I select module "Follow Up"
    Then I store case list count

      # perform 'recovery' sync
    Then I go back to the home screen
    Then I stage a recovery sync
    Then I sync

      # make sure the same number of cases are around
    Then I press start
    Then I select module "Follow Up"
    Then I assert case list count against stored count
