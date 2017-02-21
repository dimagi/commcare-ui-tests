Feature: Airplane mode test
@Integration
Scenario: Test toggling airplane mode
	Then I install the ccz app at "app_update.ccz"
    Then I login with username "user_with_no_data" and password "123"
    Then I toggle airplane mode
    Then I wait 
    Then I press start
    Then I toggle airplane mode
    Then I wait
    Then I see the text "Module Three"
