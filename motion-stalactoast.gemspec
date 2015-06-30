# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-stalactoast/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "motion-stalactoast"
  spec.version       = Stalactoast::VERSION
  spec.authors       = ["Steve Kellock"]
  spec.email         = ["steve@kellock.ca"]
  spec.description   = "RubyMotion toast-like notifications from above!"
  spec.summary       = "A RubyMotion library for iOS 7+ to display Toast-like notification messages."
  spec.homepage      = "https://github.com/skellock/motion-stalactoast"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "motion-cocoapods", "~> 1" # TODO: why this version?
  spec.add_development_dependency "rake", "~> 10"
end
