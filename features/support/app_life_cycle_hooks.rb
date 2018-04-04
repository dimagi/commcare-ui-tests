require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  ENV["RESET_BETWEEN_SCENARIOS"] = '0'
  start_test_server_in_background
end

After do |scenario|
  if scenario.failed?
    screenshot_embed
  end
  ENV["RESET_BETWEEN_SCENARIOS"] = '1'
  shutdown_test_server
end
