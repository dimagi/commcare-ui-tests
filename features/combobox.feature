Feature: Combobox Question Type
	
@Combobox
Scenario: Combobox
	Then I install the ccz app at "question_types.ccz"
	Then I login with username "user_with_no_data" and password "123"
	Then I press start
	Then I select module "Question Types"
	And I select form "Combobox" 

	#confirm filtered search is working
	Then Next
	Then I select the combobox text field
	Then I enter text "App"
	Then I wait
	Then I see the text "Apple"
	Then I see the text "Apply"

	Then I clear the combobox text field
	Then I select the combobox text field
	Then I enter text "C"
	Then I see the text "Cry"
	Then I see the text "Crate"
	Then I don't see the text "Apple"

	#Confirm you can't enter any unexpected text if it won't match the filter
	Then I enter text "ra"
	Then I see the text "Crate"
	Then I don't see the text "Cry"
	Then I enter text "z"
	Then I don't see the text "Craz"

	#Test Persistance
	Then I clear the combobox text field
	Then I select the combobox text field
	Then I touch the "Crate" text
 	Then Next
	Then Prev
	Then I see the text "Crate"

	Then I clear the combobox text field
	Then I select the combobox text field
	Then I enter text "balloon"
	Then Next
	Then Prev

	#Test that text changes to correct input after swiping
	Then I see the text "Balloon"
	Then I select the combobox text field
	Then I clear the combobox text field

	#Confirm you can submit
	Then Next
	Then Submit