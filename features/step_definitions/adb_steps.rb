Then (/^I start "([^\"]*)" activity with extras "([^\"]*)"$/) do |activity, extra|
 system("adb shell am start -n " + "#{getApplicationId}/org.commcare.activities." + activity + " " + extra)
end

Then (/^I set the next restore to clear cache$/) do
   clear_restore_cache()
end

Then (/^I stage a recovery sync$/) do
  stage_recover()
end

Then (/^I push file with path "([^\"]*)" to "([^\"]*)"$/) do |source, destination|
  push(source, destination)
end

Then (/^I broadcast image attachment with file path "([^\"]*)"$/) do |file_path|
  system(receiver_command("#{getApplicationId}.api.action.SetImageWidgetPath") + " --es file_path " + file_path)
end

def receiver_command(action)
    return "adb shell am broadcast -a #{action} -n #{getApplicationId}/org.commcare.provider.DebugControlsReceiver"
end

def clear_restore_cache()
    system(receiver_command("#{getApplicationId}.api.action.ClearCacheOnRestore"))
end

def stage_recover()
    system(receiver_command("#{getApplicationId}.api.action.TriggerSyncRecover"))
end

def getApplicationId()
    return "org.commcare.dalvik"
end