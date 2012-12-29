# motion-logger

A thin wrapper of CocoaLumberjack for RubyMotion.

Status: Basic features working

## Usage

```ruby
Log = Motion::Log

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

```ruby
require 'rubygems'
require 'motion-logger'

Motion::Project::App.setup do |app|
  app.name = 'MyApp'

  # Only needed if you are not already using pods
  app.pods do
    pod 'CocoaLumberjack'
  end
end
```

## License

```
Copyright (c) 2012, Francis Chong <francis@ignition.hk>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
