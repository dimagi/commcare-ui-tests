Feature: Test dialog creation
@Basic
Scenario: Make sure dialogs create, dismiss, and rotate correctly
    Then I install the ccz app at "integration_test_app.ccz"
    Then I login with username "test" and password "123"
    Then I press start
    Then I select module "Errors"

    Then I select form "Error on open"

    Then I see the text "Error Occurred"
    Then I rotate to landscape
    Then I see the text "Error Occurred"
    Then I rotate to portrait
    Then I touch the "OK" text

    Then I select form "Error on repeat creation"
    Then Next

    # check the repeat creation dialog
    Then I see the text "Add a new"
    Then I rotate to landscape
    # Expect dialog to not persist due to a activity lifecycle bug in our
    # dialog framework. We might eventually fix this.
    Then I don't see the text "Add a new"
    Then I rotate to portrait
    Then Next
    Then I touch the "Add Group" text

    # check that error dialog shows right after repeat dialog
    Then I wait to see "Error Occurred"
    Then I rotate to landscape
    Then I see the text "Error Occurred"
    Then I rotate to portrait
    Then I touch the "OK" text

    Then I go back to the home screen
    Then I select "About CommCare" menu item
    Then I see the text "OK"
    Then I rotate to landscape
    Then I see the text "OK"
    Then I rotate to portrait
