# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'rails'
require 'bundler/setup'
Bundler.require
require_relative 'dummy_app'
require 'rails/test_help'
require 'roundabout'
require 'roundabout/minitest'

ActiveRecord::Migration.verbose = false
CreateAllTables.up
