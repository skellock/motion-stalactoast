# -*- coding: utf-8 -*-
require "bundler/gem_tasks"
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require './lib/motion-stalactoast'

require 'bundler'
# require 'motion/project/template/gem/gem_tasks'
Bundler.require

Motion::Project::App.setup do |app|
  app.identifier = 'ca.kellock.motion-stalactoast'
  app.name = 'motion-stalactoast'
  app.deployment_target = ENV["DEPLOYMENT_TARGET"] if ENV["DEPLOYMENT_TARGET"]
end
