@CaseListSearch
Feature: List Search

  Scenario: Searching and sorting the case list
    Then I install the ccz app at "test_list_search.ccz"
    Then I login with username "test_list_search" and password "123"
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "Search Tests"

      #Base Set
    Then I see the text "Christy"
    Then I see the text "Matthew"
    Then I see the text "Steven"
    Then I see the text "Tuco"

      #exact match subset filtering
    Then I press view with id "search_action_bar"
    Then I enter text "c"
    Then I see "2 of 4"
    Then I see "Christy"
    Then I see "Tuco"

      #Incremental
    Then I enter text "h"
    Then I see "1 of 4"
    Then I see "Christy"

      #persist on rotation
    Then I rotate to landscape
    Then I wait
    Then I close the keyboard
    Then I wait

    Then I see "1 of 4"
    Then I see "ch"
    Then I see "Christy"


    Then I rotate to portrait
    Then I see "1 of 4"
    Then I see "ch"
    Then I see "Christy"

      #Clear
    Then I press view with id "search_close_btn"
    Then I don't see the text "results for your search"
    Then I see the text "Christy"
    Then I see the text "Matthew"
    Then I see the text "Steven"
    Then I see the text "Tuco"

      #Still in search mode
    Then I don't see "Search Tests"

      #Start Over
    Then I go back to the home screen
    Then I scroll until I see the "Start" text
    Then I touch the "Start" text

    Then I select module "Search Tests"

      #clearing searches other way
    Then I press view with id "search_action_bar"
    Then I enter text "x"
    Then I see "0 of 4"

      #first removes focus from entry text, second actually goes back
    Then I go back
    Then I go back

    Then I don't see the text "results for your search"
    Then I see the text "Christy"
    Then I see the text "Matthew"
    Then I see the text "Steven"
    Then I see the text "Tuco"

    Then I see the text "Search Tests"

      #Fuzzy match
    Then I press view with id "search_action_bar"
    Then I enter text "kri"
    Then I see "0 of 4"
    Then I don't see the text "Christy"
    Then I enter text "sty"
    Then I see "1 of 4"
    Then I see the text "Christy"


    






