@Tiles
Feature: Case Tiles

  Scenario: No tile
    Then I install the ccz app at "tiles.ccz"
    Then I login with username "tile.test" and password "123"
    Then I press start

    Then I select module "NoPersist"

    #Full Tile

    Then I see the text "Sally Ride"
    Then I see the text "Sex F"
    Then I see the text "Date"
    Then I see the text "01/07/17"

    Then I touch the "Sally Ride" text
    #Detail Screen    
    Then I don't see the tile expand button
    Then I don't see the text "Sex F"        
    Then I touch the "Continue" text

    #Module Screen    
    Then I don't see the text "Sally Ride"
    Then I touch the "Placeholder" text

    #Form Screen    
    Then I see the text "Inside"
    Then I don't see the text "Sally Ride"

  Scenario: Persistent Tile w/Dropdown
    Then I login with username "tile.test" and password "123"
    Then I press start

    Then I select module "PersistentInline"

    Then I touch the "Sally Ride" text


    #Module Screen
    Then I see the text "Placeholder"

    #Full Tile
    Then I see the text "Sally Ride"
    Then I see the text "Sex F"
    Then I see the text "Date"
    Then I see the text "01/07/17"
    

    Then I see the tile expand button

    Then I press the tile expand button

    #Expanded List
    Then I see the text "Sex F"    
    Then I see the text "Secret"

    Then I press the tile expand button

    Then I don't see the text "Secret"

    # Test using the back button to close the expanded tile
    Then I press the tile expand button
    Then I see the text "Secret"
    Then I go back
    # I should now see the full Tile but not expanded
    Then I don't see the text "Secret"
    Then I see the text "Sally Ride"
    Then I see the text "Sex F"
    Then I see the text "Date"
    Then I see the text "01/07/17"
    Then I go back
    # Should now actually be on previous screen
    Then I verify that the current activity is "EntitySelectActivity"
    Then I touch the "Sally Ride" text

    #Full Tile
    Then I see the text "Sally Ride"
    Then I see the text "Sex F"
    Then I see the text "Date"
    Then I see the text "01/07/17"

    Then I see the tile expand button    

    Then I touch the "Placeholder" text

    #Form Screen
    Then I see the text "Inside"

    #Full Tile
    Then I see the text "Sally Ride"
    Then I see the text "Sex F"
    Then I see the text "Date"
    Then I see the text "01/07/17"
    
    Then I see the tile expand button

    Then I press the tile expand button

    #Expanded List
    Then I see the text "Sex F"    
    Then I see the text "Secret"

    Then I press the tile expand button

    Then I don't see the text "Secret"

    #Full Tile
    Then I see the text "Sally Ride"
    Then I see the text "Sex F"
    Then I see the text "Date"
    Then I see the text "01/07/17"

    Then I see the tile expand button    

    
  Scenario: Persistent w/Detail
    Then I login with username "tile.test" and password "123"
    Then I press start

    Then I select module "PersistentWithDetail"

    Then I touch the "Sally Ride" text

    #Detail Screen
    Then I see the text "Secret"

    #Tile on Detail
    Then I see the text "Sex F"    
    Then I don't see the tile expand button

    Then I touch the "Continue" text

    #Module Screen
    Then I see the text "Placeholder"
    Then I see the text "Sex F"    
    Then I don't see the tile expand button
    
    Then I touch the "Placeholder" text

    #Form Screen
    Then I see the text "Inside"
    
    Then I see the text "Sex F"    
    Then I don't see the tile expand button    


  Scenario: Persistent no Detail no Inline
    Then I login with username "tile.test" and password "123"
    Then I press start

    Then I select module "PersistentNoDetailNoInline"

    Then I touch the "Sally Ride" text

    #Module Screen
    Then I see the text "Placeholder"

    Then I see the text "Sex F"    
    Then I don't see the text "Secret"
    Then I don't see the tile expand button
    
    Then I touch the "Placeholder" text

    #Form Screen
    Then I see the text "Inside"
    
    Then I see the text "Sex F"    
    Then I don't see the text "Secret"
    Then I don't see the tile expand button

  Scenario: Breadcrumb
    Then I login with username "tile.test" and password "123"
    Then I press start

    Then I select module "Breadcrumb"

    Then I touch the "Sally Ride" text

    #Module Screen
    Then I see the text "Placeholder"

    Then I see the text "Sally Ride"    
    Then I don't see the text "Sex F"    
    Then I don't see the text "Secret"
    Then I don't see the tile expand button
    
    Then I touch the "Placeholder" text

    #Form Screen
    Then I see the text "Inside"

    Then I see the text "Sally Ride"    
    Then I don't see the text "Sex F"    
    Then I don't see the text "Secret"
    Then I don't see the tile expand button
