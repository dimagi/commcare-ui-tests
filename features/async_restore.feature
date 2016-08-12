Feature: Perform Async Restore

@Integration @2.29
Scenario: Do an async restore on an initial login

	# Make sure user many.cases1 is in the Async Restore Testing group
	Then I make sure that user "13a0910ea963acbf9f4b59dcc9a0f9aa" is in group "78185f2132bd8ba3af30b488f9974b41"

	Then I install the ccz app at "integration_test_app.ccz"
	Then I set the next restore to clear cache
	Then I login with username "many.cases1" and password "123", without waiting for completion
	Then I check that an async restore occurred successfully

@Integration @2.29
Scenario: Do an async restore on an incremental sync

	# Make sure that the user many.cases2 is NOT in the Async Restore Testing group
	Then I make sure that user "81f1645b41d85b539a7e407b035bfbf1" is not in group "78185f2132bd8ba3af30b488f9974b41"

	Then I set the next restore to clear cache
	Then I login with username "many.cases2" and password "123"

	# Now put many.cases2 back into the Async Restore Testing group
	Then I make sure that user "81f1645b41d85b539a7e407b035bfbf1" is in group "78185f2132bd8ba3af30b488f9974b41"

	Then I sync, without waiting for completion
	Then I check that an async incremental sync occurred successfully
