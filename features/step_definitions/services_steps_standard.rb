# Useful page with all of the keyevent codes and what they do https://groups.google.com/forum/#!topic/android-developers/pHBcP2JBT5A
# These commands do the same thing; however, for the sake of parity with AWS command we treat them as separate
# Anything added to this file should also be added to aws/aws_steps as that file will completely replace this one
# when running on AWS.

Then (/^I turn off the internet$/) do
  system("adb shell am start -a android.settings.AIRPLANE_MODE_SETTINGS && sleep 0.5")
  system("adb shell input keyevent 19 && sleep 1 && adb shell input keyevent 23")
  system("adb shell input keyevent 4")
end

Then (/^I turn on the internet$/) do
  system("adb shell am start -a android.settings.AIRPLANE_MODE_SETTINGS && sleep 0.5")
  system("adb shell input keyevent 19 && sleep 1 && adb shell input keyevent 23")
  system("adb shell input keyevent 4")
end

Then (/^I create a user with name "([^\"]*)" and password "([^\"]*)"$/) do |name, password|
  system("python3 commcare-hq-api/commcare_hq_api.py user_create #{name} #{password}")
end