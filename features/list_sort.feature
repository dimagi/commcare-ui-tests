@CaseListSort
Feature: List Sorting

  Scenario: Sorting Select Lists
    Then I install the ccz app at "test_list_search.ccz"
    Then I login with username "test_sort" and password "123"
    Then I scroll until I see the "Start" text
    Then I press start

    Then I select module "Sort Tests"

    Then I wait
    Then I see "Missing" above "Earliest"
    Then I see "Earliest" above "Middle"
    Then I see "Middle" above "Last"

    Then I select "Sort By..." menu item
    Then I touch the "Name" text

    Then I see "Earliest" above "Last"
    Then I see "Last" above "Middle"
    Then I see "Middle" above "Missing"

    Then I select "Sort By..." menu item
    Then I touch the "(^) Name" text

    Then I see "Missing" above "Middle"
    Then I see "Middle" above "Last"
    Then I see "Last" above "Earliest"

    

