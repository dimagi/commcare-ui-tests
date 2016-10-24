Feature: Test mobile worker changes on HQ
    @Integration
    Scenario: Change mobile worker password with
        # make sure the password is reset
        Then I change "c4dcdd5d5bee675fe211e285d252f0c6" password to "pw1"
        Then I install the ccz app at "integration_test_app.ccz"

        Then I login with username "pw_change" and password "pw1"
        Then I logout
        Then I change "c4dcdd5d5bee675fe211e285d252f0c6" password to "pw2"

        # old password still works
        Then I login with username "pw_change" and password "pw1"

        Then I sync
        # Full text: Password has changed. Please log in with updated credentials
        Then I see the text "Password has changed" 
        Then I logout

        # new password also works
        Then I login with username "pw_change" and password "pw2"
        Then I sync

    @Integration
    Scenario: Change mobile worker password with pending form submission
        # make sure the password is set to pw1
        Then I change "c4dcdd5d5bee675fe211e285d252f0c6" password to "pw1"
        Then I login with username "pw_change" and password "pw1"

        # I fill out a form in airplane mode
        Then I toggle airplane mode
        Then I touch the "Start" text
        Then I select module "Misc"
        And I select form "Lookup Tables"
        Then Submit
        Then I change "c4dcdd5d5bee675fe211e285d252f0c6" password to "pw2"
        Then I toggle airplane mode

        Then I wait for 3 seconds
        Then I sync
        # Full text: Password has changed. Please log in with updated credentials
        Then I see the text "Password has changed" 
        Then I clear user data
        Then I change "c4dcdd5d5bee675fe211e285d252f0c6" password to "pw1"

    @Integration
    Scenario: Locally expire mobile worker key record
        # make sure the password is set to pw1
        Then I change "c4dcdd5d5bee675fe211e285d252f0c6" password to "pw1"

        Then I login with username "pw_change" and password "pw1"
        # make sure you can login offline after the key record expired
        # this is subject to change if we ever do rolling, proactive key record
        # updates
        Then I locally expire user "pw_change"
        Then I toggle airplane mode
        Then I logout
        Then I login with username "pw_change" and password "pw1"
        Then I see the text "Start"
        Then I toggle airplane mode
