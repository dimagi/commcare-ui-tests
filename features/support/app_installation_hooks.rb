require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  FeatureMemory.feature = nil
end

Before do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)

  feature = scenario.feature
  if FeatureMemory.feature != feature
    log "Feature memory feature ${FeatureMemory.feature}, scenario feature ${scenario.feature}"

    ensure_app_installed

    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

FeatureMemory = Struct.new(:feature, :invocation).new
