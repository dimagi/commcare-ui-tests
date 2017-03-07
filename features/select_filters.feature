@FormFiltering
Feature: Select Filters

  Scenario: Filtering forms by case data
    Then I install the ccz app at "test_select_filters.ccz"
    Then I login with username "test_filter" and password "123"
    Then I press start

    Then I select module "Selection Tests"

      #Case Select
    Then I see the text "Select A"
    Then I see the text "Select B"
    Then I see the text "Select C"

      #Case: A
    Then I touch the "Select A" text
    Then I see "Placeholder"
    Then I see "Case Data Filterable Form"
    Then I go back

      #Case: A
    Then I touch the "Select B" text
    Then I see "Placeholder"
    Then I see "Case Data Filterable Form"
    Then I go back

      #Case: C
    Then I touch the "Select C" text
    Then I see "Placeholder"
    Then I go back

  Scenario: Filtering forms by user data
    Then I login with username "test_filters_user_data" and password "123"
    Then I press start

    Then I select module "Selection Tests"

      #Case Select
    Then I see the text "Select A"
    Then I see the text "Select B"
    Then I see the text "Select C"

      #Case: A
    Then I touch the "Select A" text
    Then I see "Placeholder"
    Then I see "Case Data Filterable Form"
    Then I see "User Filterable Form"
    Then I go back

      #Case: A
    Then I touch the "Select B" text
    Then I see "Placeholder"
    Then I see "Case Data Filterable Form"
    Then I see "User Filterable Form"
    Then I go back

      #Case: C
    Then I touch the "Select C" text
    Then I see "Placeholder"
    Then I see "User Filterable Form"
    Then I go back


  Scenario: Filtering forms by user data with no case select in the session
    Then I login with username "test_filter" and password "123"
    Then I press start

    Then I select module "Filter Tests"

    Then I see the text "Select B"
    Then I see the text "Select C"

    Then I don't see the text "Select A"
    
