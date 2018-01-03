Then (/^I start "([^\"]*)" activity with extras "([^\"]*)"$/) do |activity, extra|
 system("adb shell am start -n " + "org.commcare.dalvik.debug/org.commcare.activities." + activity + " " + extra)
end

Then (/^I set the next restore to clear cache$/) do
   clear_restore_cache()
end

Then (/^I stage a recovery sync$/) do
  stage_recover()
end

def receiver_command(action)
    return "adb shell am broadcast -a #{action}"
end

def clear_restore_cache()
    system(receiver_command("org.commcare.dalvik.debug.api.action.ClearCacheOnRestore"))
end

def stage_recover()
    system(receiver_command("org.commcare.dalvik.debug.api.action.TriggerSyncRecover"))
end