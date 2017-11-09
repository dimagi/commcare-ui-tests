Then (/^I start "([^\"]*)" activity with extras "([^\"]*)"$/) do |activity, extra|
 system("adb shell am start -n " + "org.commcare.dalvik.debug/org.commcare.activities." + activity + " " + extra)
end