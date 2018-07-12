require 'calabash-android/management/app_installation'

AfterConfiguration do |config|
  puts "Config #{config}"
  ENV['RESET_BETWEEN_SCENARIOS'] ='0'
  FeatureMemory.feature = nil
end

Before do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)

  feature = scenario.feature
  if FeatureMemory.feature != feature
    puts("This is just a test log")
    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

FeatureMemory = Struct.new(:feature, :invocation).new
