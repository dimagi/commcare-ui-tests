Feature: Verify that syncing with a deleted user errors correctly

@Integration @2.31
Scenario: Create and restore a user, then delete and sync
    Then I uninstall the "com.dimagi.test.external" apk app
    Then I install the "commcare-tester-app-debug" apk
    Then I open the "com.dimagi.test.external/com.dimagi.test.external.ExternalAppActivity" app
    Then I touch the "ACQUIRE COMMCARE KEY" text
    Then I touch the "Grant Access" text
