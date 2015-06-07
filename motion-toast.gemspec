# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-toast/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "motion-toast"
  spec.version       = MotionToast::VERSION
  spec.authors       = ["Steve Kellock"]
  spec.email         = ["steve@kellock.ca"]
  spec.description   = "Get your toast on with RubyMotion!"
  spec.summary       = "A RubyMotion library for iOS 7+ to display Toast-like notification messages."
  spec.homepage      = "https://github.com/skellock/motion-toast"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("rake", "~> 10.0")
end
