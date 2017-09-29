@ManualQuarantine
Feature: Manually Quarantining a Form

Scenario: Create and quarantine 2 forms
	Then I install the ccz app at "ccqa.ccz"
	Then I login with username "test" and password "1234"

	Then I turn off the internet

	# Complete 2 forms with the internet off, so that they don't submit

	Then I wait for 5 seconds
	Then I press start
	Then I scroll until I see the "Display Form" text
	Then I select form "Display Form"
	Then Submit
	Then I go back to the home screen
	Then I wait
	Then I press start
	Then I scroll until I see the "Display Form" text
	Then I select form "Display Form"
	Then Submit


	# Go to saved forms and quarantine them

	Then I go back to the home screen
	Then I select "Saved Forms" menu item
	
	# for 1st form
	Then I long press "Display Form"
	# Unsent forms should not be delete-able
	Then I don't see the text "Delete Record"
	Then I touch the "Scan Record Integrity" text
	Then I touch the "QUARANTINE FORM" text
	
	# for 2nd form
	Then I long press "Display Form"
	# Unsent forms should not be delete-able
	Then I don't see the text "Delete Record"
	Then I touch the "Scan Record Integrity" text
	Then I touch the "QUARANTINE FORM" text

Scenario: Put one back into the unsent queue and send it
	
	Then I login with username "test" and password "1234"
	Then I select "Saved Forms" menu item
	Then I press view with id "entity_select_filter_dropdown"
	Then I touch the "Filter: Quarantined Forms" text
	
	# Send 1 form back to unsent queue
	Then I long press "Display Form"
	Then I touch the "Add Record Back to Unsent Queue" text
	
	# Confirm there is 1 form left in quarantine, and that you can delete it
	Then I long press "Display Form"
	Then I touch the "Delete Record" text
	Then I don't see the text "Display Form"

	# Confirm 1 form is now in unsent
	Then I press view with id "entity_select_filter_dropdown"
	Then I touch the "Only Unsent Forms" text
	Then I see the text "Display Form"

	Then I go back
	Then I turn on the internet
	Then I wait for 10 seconds
	Then I touch the "Sync with Server" text
	Then I see the text "1 form sent to server!"

