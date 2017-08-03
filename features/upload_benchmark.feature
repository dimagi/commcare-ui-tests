@Upload
Feature: Benchmarking Upload

  @Benchmark
  Scenario: Upload Multiple Forms to HQ
    Then I install the ccz app at "upload_test.ccz"
    Then I login with username "upload.test" and password "123"

    # Enable Developer Options
    Then I enable Developer Options
    Then I select "Settings" menu item
    Then I scroll until I see the "Developer Options" text
    Then I touch the "Developer Options" text
    Then I wait to see "Developer Mode Enabled"

    # Load Forms from form_upload.xml
    Then I scroll until I see the "Load form payload status" text
    Then I touch the "Load form payload status" text
    Then I wait to see "Unsent"
    Then I touch the "Unsent" text
    Then I touch the "Form Record File" text
    Then I load the forms from "form_upload.xml"
    Then I touch the "OK" text
    Then I go back
    Then I go back
    Then I select "Saved Forms" menu item
    Then I select "Fetch Forms from File" menu item

    # Upload Forms
    Then I sync, without waiting for completion
    Then I wait
    Then I wait for progress up to 600 seconds

     # confirm form was sent
    Then I don't see the text "Unsent Forms:"
    Then I press start
    Then I wait
    Then I go back
    Then I see the text "You last synced with the server:"



