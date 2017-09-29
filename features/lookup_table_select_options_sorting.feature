@LookupTableOptionSorting
Feature: Lookup Table Select Options Sorting

Scenario: Test the sorting of answer choices in a Lookup Table Select Question

	Then I install the ccz app at "lookup_table_sort_test.ccz"
	Then I login with username "test" and password "123"

	# Proves that the answer choices aren't just coincidentally already sorted
	Then I press start
	Then I select module "Test Forms"
	Then I select form "Lookup Table Select WITHOUT sorting"
	Then I wait for form to load
	Then I see a list of options in the given order "Orange,Banana,Plum,Pear,Grape,Kiwi,Apple"
	Then I go back to the home screen

	Then I press start
	Then I select module "Test Forms"
	Then I select form "Lookup Table Select WITH sorting"
	Then I wait for form to load
	Then I see a list of options in the given order "Apple,Banana,Grape,Kiwi,Orange,Pear,Plum"