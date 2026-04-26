#!/usr/bin/env ruby
# Adds a RunnerUITests UI-test target to ios/Runner.xcodeproj.
# Idempotent — safe to run multiple times.

require 'xcodeproj'

project_path = File.expand_path('Runner.xcodeproj', __dir__)
project = Xcodeproj::Project.open(project_path)

ui_test_target_name = 'RunnerUITests'
existing = project.targets.find { |t| t.name == ui_test_target_name }
if existing
  puts "Target #{ui_test_target_name} already exists — nothing to do."
  exit 0
end

runner_target = project.targets.find { |t| t.name == 'Runner' }
abort 'Runner target not found' unless runner_target

ui_test_target = project.new_target(
  :ui_test_bundle,
  ui_test_target_name,
  :ios,
  '13.0',
  project.products_group,
  :objc
)

# Attach the source file (already created at ios/RunnerUITests/RunnerUITests.m).
file_ref = project.new_file('RunnerUITests/RunnerUITests.m')
ui_test_target.add_file_references([file_ref])

# Make the UI test target depend on the Runner app target.
ui_test_target.add_dependency(runner_target)

# Default build settings expected by Xcode UI test targets.
ui_test_target.build_configurations.each do |config|
  config.build_settings['INFOPLIST_FILE'] = 'RunnerUITests/Info.plist'
  config.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] =
    'com.example.twakeCalendarMobile.RunnerUITests'
  config.build_settings['TEST_TARGET_NAME'] = 'Runner'
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  config.build_settings['CODE_SIGN_STYLE'] = 'Automatic'
  config.build_settings['SWIFT_VERSION'] = '5.0'
  config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
  config.build_settings['LD_RUNPATH_SEARCH_PATHS'] =
    "$(inherited) @executable_path/Frameworks @loader_path/Frameworks"
end

# Wire the UI test scheme so `patrol test` can find it.
project.save

puts "Added #{ui_test_target_name} target to Runner.xcodeproj."
