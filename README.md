# motion-logger

A thin wrapper of CocoaLumberjack for RubyMotion.

Status: Basic features working

## Usage

```ruby
file_logger = DDFileLogger.new
file_logger.rollingFrequency = 60 * 60 * 24
file_logger.logFileManager.maximumNumberOfLogFiles = 1
Log.addLogger file_logger

tty_logger = DDTTYLogger.sharedInstance
Log.addLogger tty_logger

Log.level = :warn

Log.info "Hello World"
Log.warn "WARNING!"
Log.debug "Lah"
Log.flush
```

## Setup

Install the gem:

```
gem install motion-logger
```

Require the gem in Rakefile:

```
require 'rubygems'
require 'motion-logger'

Motion::Project::App.setup do |app|
  app.name = 'MyApp'

  # Only needed if you are not already using pods
  app.pods do
    dependency 'CocoaLumberjack'
  end
end
```