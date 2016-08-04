Feature: Perform Async Restore

@Integration
Scenario: Do an async restore on an initial login

	# Make sure user restore.test1 is in the Async Restore Testing group
	Then I make sure that user "846250bb7a18cf84fb5c927639c0545f" is in group "62a9917f69303a1507454beb82ec7644"

	Then I install the ccz app at "async_restore_test.ccz"
	Then I set the next restore to clear cache
	Then I login with username "restore.test1" and password "123", without waiting for completion
	Then I check that an async restore occurred successfully

@Integration
Scenario: Do an async restore on an incremental sync

	# Make sure that the user restore.test2 is NOT in the Async Restore Testing group
	Then I make sure that user "846250bb7a18cf84fb5c927639df8ab0" is not in group "62a9917f69303a1507454beb82ec7644"

	Then I set the next restore to clear cache
	Then I login with username "restore.test2" and password "123"

	# Now put restore.test2 back into the Async Restore Testing group
	Then I make sure that user "846250bb7a18cf84fb5c927639df8ab0" is in group "62a9917f69303a1507454beb82ec7644"

	Then I sync, without waiting for completion
	Then I check that an async incremental sync occurred successfully