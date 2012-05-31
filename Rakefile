$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'motion-cocoapods'
require './lib/motion-logger'

Motion::Project::App.setup do |app|
  app.name = 'logger'

  app.pods do
    dependency 'CocoaLumberjack'
  end
end
