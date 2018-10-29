# frozen_string_literal: true

this = self.singleton_class
using Module.new {
  refine this do
    alias squire require
    alias squire_relative require_relative
  end
}

ENV['RAILS_ENV'] ||= 'test'
ENV['ROUNDABOUT'] ||= '1'
squire 'rails'
squire 'bundler/setup'
squire 'sprockets/rails'
Bundler.require
squire_relative 'dummy_app'
squire 'rails/test_help'
squire 'roundabout'
squire 'roundabout/minitest'

ActiveRecord::Migration.verbose = false
CreateAllTables.up

User.create! name: 'Chris'
