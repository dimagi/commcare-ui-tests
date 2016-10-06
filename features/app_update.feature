Feature: App update test
@Integration @QA
Scenario: Ensure app update can be obtained from HQ 
    Then I install the ccz app at "app_update.ccz"
    Then I login with username "user_with_no_data" and password "123"

    # check base form content
    Then I press start
    Then I see the text "Module Three"
    Then I select module "Module One"
    And I select form "Example 1"
    Then I see the text "A text question"
    Then I go back to the home screen

    # make sure case list only has 1 column
    Then I press start
    Then I select module "Module Two"
    Then I select module "Update Case"
    Then I don't see the text "Status"
    Then I go back to the home screen

    # download the app update
    Then I select "Update App" menu item
    Then I see the text "Current version: 2"
    Then I touch the "Stop checking" text

    Then I rotate to portrait
    Then I touch the "Recheck" text
    Then I rotate to landscape

    Then I wait to see "Update to version"
    Then I see the text "version 11"
    Then I rotate to portrait

    # reopen update screen to see if progress is saved
    Then I wait
    Then I go back
    Then I wait
    Then I select "Update App" menu item
    Then I wait to see "Update to version"
    Then I apply the update

    # check updated data, including multimedia
    Then I login with username "user_with_no_data" and password "123"

    Then I press start
    Then I don't see the text "Module Three"
    Then I select module "Module One"
    And I select form "Example 1"
    Then I see the text "Question with audio"
    Then I see at least one element of type "AudioButton"
    Then I go back to the home screen

    # make sure case list column was added
    Then I press start
    Then I select module "Module Two"
    Then I select module "Update Case"
    Then I see the text "Status"
    Then I go back to the home screen

    # make sure there are no new updates
    Then I select "Update App" menu item
    Then I see the text "Current version: 11"
    Then I touch the "Recheck" text
    Then I see the text "Current version: 11"

    # turn off wifi and try updating
    Then I go back
    Then I toggle airplane mode
    Then I wait
    Then I select "Update App" menu item
    Then I wait
    Then I check that id "button" is disabled
    Then I see the text "No network connectivity"
    Then I toggle airplane mode
