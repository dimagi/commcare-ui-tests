Then (/^I turn wifi off$/) do
  system("adb shell svc wifi disable")
end

Then (/^I turn wifi on$/) do
  system("adb shell svc wifi enable")
end
