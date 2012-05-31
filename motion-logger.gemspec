# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bubble-wrap/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Francis Chong"]
  gem.email         = ["francis@ignition.hk"]
  gem.description   = "A thin wrapper of CocoaLumberjack for RubyMotion."
  gem.summary       = "A thin wrapper of CocoaLumberjack for RubyMotion."
  gem.homepage      = "https://github.com/siuying/motion-logger"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-logger"
  gem.require_paths = ["lib"]
  gem.version       = BubbleWrap::VERSION
end