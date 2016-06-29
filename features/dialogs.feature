Feature: Test dialog creation
@Basic
Scenario: Make sure dialogs create, dismiss, and rotate correctly
    Then I install the ccz app at "integration_test_app.ccz"
    Then I login with username "test" and password "123"
    Then I press start
    Then I select module "Errors"

    Then I select module "Error on open"
    Then I wait for form entry

    Then I see the text "Error Occurred"
    Then Rotate Landscape
    Then I see the text "Error Occurred"
    Then Rotate Portrait
    Then I touch the "OK" text

    Then I select module "Error on repeat creation"
    Then I wait for form entry
    Then Next

    # check the repeat creation dialog
    Then I see the text "Add a new"
    Then Rotate Landscape
    Then I see the text "Add a new"
    Then Rotate Portrait
    Then I touch the "Add Group" text

    # check that error dialog shows right after repeat dialog
    Then I wait to see "Error Occurred"
    Then Rotate Landscape
    Then I see the text "Error Occurred"
    Then Rotate Portrait
    Then I touch the "OK" text

    Then I go back to the home screen
    Then I select "About CommCare" menu item
    Then I see the text "Copyright"
    Then Rotate Landscape
    Then I see the text "Copyright"
    Then Rotate Portrait
