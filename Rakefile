# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

require 'bundler'
Bundler.require(:development)
require './lib/motion-toast'

Motion::Project::App.setup do |app|
  app.identifier = 'ca.kellock.motion-toast'
  app.name = 'motion-toast'
  app.deployment_target = ENV["DEPLOYMENT_TARGET"] if ENV["DEPLOYMENT_TARGET"]
end
