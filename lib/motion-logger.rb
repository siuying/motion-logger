unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'logger/*.rb')).each do |file|
    app.files.unshift file
  end

  app.pods ||= Motion::Project::CocoaPods.new(app)
  app.pods.pod 'CocoaLumberjack'
end