require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  FeatureMemory.feature = nil
end

$first_run = true

Before do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)

  feature = scenario.feature
  if FeatureMemory.feature != feature || ENV['RESET_BETWEEN_SCENARIOS'] == '1'
    if ENV['RESET_BETWEEN_SCENARIOS'] == '1'
      log 'New scenario - reinstalling apps'
    else
      log 'First scenario in feature - reinstalling apps'
    end

    if $first_run
      $first_run = false
      uninstall_apps
      install_app(ENV["TEST_APP_PATH"])
      install_app(ENV["APP_PATH"])
    end

    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

FeatureMemory = Struct.new(:feature, :invocation).new
