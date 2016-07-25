Feature: Perform Async Restore
@Integration
Scenario: Make sure async restores work

	Then I install the ccz app at "async_restore_test.ccz"
	Then I set the next restore to clear cache
	Then I login with username "restore.test1" and password "123", without waiting for home screen
	Then I check that an async restore occurred successfully

