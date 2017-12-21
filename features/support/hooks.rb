require 'calabash-android/management/adb'
require 'calabash-android/operations'

permission_array = ["CAMERA", "CALL_PHONE", "READ_EXTERNAL_STORAGE", "RECORD_AUDIO", "ACCESS_FINE_LOCATION"]

Before do |scenario|
  permission_array.each { |permission| grant_permission(permission) }
end

def grant_permission(permission)
  log "Grant permission android.permission.#{permission}"
  cmd = "adb shell pm grant org.commcare.dalvik.debug.test android.permission.#{permission}"
  raise "Could not grant org.commcare.dalvik.debug.test permission for #{permission}" unless system(cmd)
  cmd = "adb shell pm grant org.commcare.dalvik.debug android.permission.#{permission}"
  raise "Could not grant org.commcare.dalvik.debug permission #{permission}" unless system(cmd)
  log "Granted permission android.permission.#{permission}"
end