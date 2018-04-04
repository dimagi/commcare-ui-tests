require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  FeatureMemory.feature = nil
end

$first_run = true

Before do |scenario|
  ENV['RESET_BETWEEN_SCENARIOS'] == '0'
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)
  feature = scenario.feature
  if FeatureMemory.feature != feature || ENV['RESET_BETWEEN_SCENARIOS'] == '1'
    if ENV['RESET_BETWEEN_SCENARIOS'] == '1'
      log 'New scenario - reinstalling apps'
    else
      log 'First scenario in feature - reinstalling apps'
    end

    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

After do |scenario|
  ENV["RESET_BETWEEN_SCENARIOS"] = '1'
end


FeatureMemory = Struct.new(:feature, :invocation).new
