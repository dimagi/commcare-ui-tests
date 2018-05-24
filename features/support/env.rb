require 'calabash-android/cucumber'
require 'calabash-android/management/app_installation'

at_exit do
  uninstall_apps
end