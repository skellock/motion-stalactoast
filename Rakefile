# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require './lib/motion-toast'

require 'bundler'
require 'motion/project/template/gem/gem_tasks'
Bundler.require

Motion::Project::App.setup do |app|
  app.identifier = 'ca.kellock.motion-toast'
  app.name = 'motion-toast'
  app.deployment_target = ENV["DEPLOYMENT_TARGET"] if ENV["DEPLOYMENT_TARGET"]
end
