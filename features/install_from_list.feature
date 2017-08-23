@Integration @InstallList
Feature: Install from list

Scenario: Install an app by getting the list of available apps for a mobile worker
	Then I select "See Apps For My User (NEW!)" menu item
	Then I verify that the current activity is "InstallFromListActivity"
	
	# Verify that we start out in mobile user auth mode
	Then I see view with id "edit_domain"
	Then I do not see view with id "edit_email"
	
	Then I press view with class "android.widget.Switch" 
	
	# Verify that we're now in web user auth mode
	Then I do not see view with id "edit_domain"
	Then I see view with id "edit_email"

	# Switch back to mobile auth view
	Then I press view with class "android.widget.Switch" 

	# Test getting app list for a mobile user
	Then I auth for install from list with username "test" and domain "commcare-tests" and password_key "install-list-mobile-password"
	
	# Check that we see each of the apps in this domain, plus the domain name
	Then I see the text "commcare-tests"
	Then I see the text "Case callout test for Simprints"
	Then I see the text "Case Search and Claim"
	Then I see the text "Integration Tests"

	# Install 1 of the apps
	Then I install app "Case Search and Claim" from the list of available apps


Scenario: Install an app by getting the list of available apps for a web user
	# Get back to the install screen
	Then I select "Go To App Manager" menu item
	Then I touch the "Install An App" text

	Then I select "See Apps For My User (NEW!)" menu item
	Then I verify that the current activity is "InstallFromListActivity"

	# Clear out our existing results
	Then I select "See Apps for Another User" menu item
	Then I wait
	
	# Verify that we start out in mobile user auth mode
	Then I see view with id "edit_domain"
	Then I do not see view with id "edit_email"
	
	Then I press view with class "android.widget.Switch" 
	
	# Verify that we're now in web user auth mode
	Then I do not see view with id "edit_domain"
	Then I see view with id "edit_email"

	# Test getting app list for a web user
	Then I auth for install from list with email "commcare.mobile.testing@gmail.com" and password_key "install-list-web-password"
	
	# This web user belongs to the commcare-tests domain and the swat domain, so we should see apps from both
	Then I scroll until I see the "commcare-tests" text
	Then I scroll until I see the "swat" text
	Then I scroll until I see the "Case callout test for Simprints" text
	Then I scroll until I see the "Case Search and Claim" text
	Then I scroll until I see the "Integration Tests" text
	Then I scroll until I see the "Demo - Form Design Patterns" text
	Then I scroll until I see the "Demo - Live XForm Examples" text
	Then I scroll until I see the "SWAT: CommCare Projects Phone Survey" text
	Then I scroll until I see the "SWAT: App Tracker" text

	# Install 1 of the apps
	Then I install app "SWAT: App Tracker" from the list of available apps
