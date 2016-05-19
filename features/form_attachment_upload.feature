Feature: Submit form with multimedia
@HasExternal @Integration
Scenario: Test that form multimedia attachments get uploaded to HQ
    Then I install the ccz app at "integration_test_app.ccz"
    Then I login with username "test" and password "123"
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text
    Then I select module "Form Attachments"
    Then I select module "Multimedia Capture"
    Then I wait for form entry
    Then I press the "Take Picture" button
    Then I take a photo
    Then Next
    Then I press the "Gather Signature" button
    Then I sign with a cross
    Then I press the "Save and Close" button
    Then Submit
    Then I wait to see "Sync"
    Then I touch the "Sync" text
    Then I wait for progress
    Then I scroll until I see the "Saved" text
    Then I touch the "Saved" text
    Then I wait for the view with id "screen_entity_select_list" to appear
    Then I see 1 list entries
