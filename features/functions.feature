Feature: Functions
Scenario: Testing Function
#Install & Login
	Then I install the ccz app at "ccqa4.ccz"
	Then I login with username "user_with_no_data" and password "123"
#Accessing the form
	Then I press start
	Then I scroll until I see the "Logic Tests" text
	Then I select module "Logic Tests"
	Then I select form "Functions"
#Answering checkbox and random number question
	Then I select option from multi-select with text "OK. Please continue."
	Then Next
	Then I see one item from the list "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50"
	Then Next
#Answering output verification questions
	Then I see the text "12"
	Then Next
	Then I see the text "1"
	Then Next
	Then I see the text "3"
	Then Next
	Then I see the text "6"
	Then Next
	Then I see the text "0"
	Then Next
	Then I see the text "2"
	Then Next
#Verifying output and navigating forward & back
	Then I enter text "9"
	Then Next
	Then I see the text "This should only display if you entered any number other than"
	Then Prev
	Then I clear input field number 1
	Then I enter text "0"
	Then Next
#Text verification and integer input
	Then I see the text "number"
	Then Next
	Then I enter text "14"
	Then Next
#Verifying integer output
	Then I see the text "15"
	Then Next
	Then I see the text "14"
	Then Next
	Then I see the text "64"
	Then Next
	Then I see the text "You should be able to see this."
#Returning to home screen
	Then I go back to the home screen
