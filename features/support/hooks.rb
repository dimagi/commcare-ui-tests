require 'calabash-android/management/adb'
require 'calabash-android/operations'

permission_array = ["CAMERA", "CALL_PHONE", "READ_EXTERNAL_STORAGE", "RECORD_AUDIO", "ACCESS_FINE_LOCATION"]

Before do |scenario|
  permission_array.each { |permission| grant_permission(permission) }
end

def grant_permission(permission)
  cmd = "adb shell pm grant org.commcare.dalvik.debug android.permission.#{permission}"
  raise "Could not set permission for #{permission}" unless system(cmd)
end