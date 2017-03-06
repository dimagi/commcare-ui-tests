Feature: Record Audio
@Basic
Scenario: Test that audio recording works
    Then I install the app at "28Qn6Cw"
    Then I login with username "sjain" and password "123"
    Then I scroll until I see the "Start" text
	Then I touch the "Start" text
	Then I select module "Audio Widget Tester"
	Then I select module "Survey 1"
	Then I hit record
	Then I start recording
	Then I play audio
	Then Next
	Then I hit record
	Then I start recording
	Then I play audio
	Then Next



