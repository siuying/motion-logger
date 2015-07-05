require "bundler/gem_tasks"
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'motion-cocoapods'
require 'motion-redgreen'
require './lib/motion-logger'

Motion::Project::App.setup do |app|
  app.name = 'logger'

  app.pods do
    pod 'CocoaLumberjack', '~> 1.9.0'
  end
end

desc "Build the gem"
task :gem do
  sh "bundle exec gem build motion-logger.gemspec"
  sh "mkdir -p pkg"
  sh "mv *.gem pkg/"
end