Then (/^I toggle airplaine mode$/) do
  system("adb shell am start -a android.settings.AIRPLANE_MODE_SETTINGS")
  system("adb shell input keyevent 19 & adb shell input keyevent 23")
  press_back_button
end
