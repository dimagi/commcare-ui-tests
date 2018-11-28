#require 'calabash-android/management/adb'
#require 'calabash-android/operations'
#
#Before do |scenario|
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.CAMERA"
#  raise "Could not set permission for CAMERA" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.RECORD_AUDIO"
#  raise "Could not set permission for RECORD_AUDIO" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.CALL_PHONE"
#  raise "Could not set permission for CALL_PHONE" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.READ_SMS"
#  raise "Could not set permission for READ_SMS" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.CAMERA"
#  raise "Could not set permission for PERMISSION_TO_GRANT" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.READ_EXTERNAL_STORAGE"
#  raise "Could not set permission for READ_EXTERNAL_STORAGE" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.WRITE_EXTERNAL_STORAGE"
#  raise "Could not set permission for WRITE_EXTERNAL_STORAGE" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.READ_PHONE_STATE"
#  raise "Could not set permission for READ_PHONE_STATE" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.ACCESS_COARSE_LOCATION"
#  raise "Could not set permission for ACCESS_COARSE_LOCATION" unless system(cmd)
#
#  cmd = "adb shell pm grant org.commcare.dalvik android.permission.ACCESS_FINE_LOCATION"
#  raise "Could not set permission for ACCESS_FINE_LOCATION" unless system(cmd)
#end