require 'calabash-android/cucumber'
require 'cucumber_characteristics/autoload'

CucumberCharacteristics.configure do |config|
	current_time = Time.now.strftime('&Y-%m-%d_%H-%M-%S')
	config.export_json = true
	config.export_html = true
	config.precision = 4
	config.target_filename = 'metrics' << current_time
	config.relative_path = 'features/characteristics'
end 
