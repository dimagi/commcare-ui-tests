Then (/^I take a photo$/) do
  # system("python monkey/camera_image_capture.py")
  sleep(2)
  system('adb shell input keyevent 27') # click take picture button
  # sleep(2)
  # tap_when_element_exists("* id:'com.android.camera:id/btn_done'")
  # tap_when_element_exists("* marked:'com.android.camera:id/btn_done'")
  # tap_when_element_exists("android.widget.ImageView index:1")
  step("I press image button number 1")
end

Then (/^I sign with a cross$/) do
  perform_action('drag', 50, 100, 50, 100, 20)
  perform_action('drag', 100, 50, 100, 50, 20)
end
