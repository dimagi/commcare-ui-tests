Then (/^I take a photo$/) do
  system("python ./monkey/camera_image_capture.py")
end

Then (/^I sign with a cross$/) do
  perform_action('drag', 50, 100, 50, 100, 20)
  perform_action('drag', 100, 50, 100, 50, 20)
end
