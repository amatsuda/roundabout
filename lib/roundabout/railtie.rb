# frozen_string_literal: true

require 'rails'
require 'roundabout/engine'

module Roundabout
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'roundabout' do
      if ENV['ROUNDABOUT']
        if Rails::VERSION::MAJOR >= 5
          ActiveSupport.on_load :action_dispatch_integration_test do
            require 'roundabout/monkey/capybara'
            require 'roundabout/rspec' if defined? RSpec
            require 'roundabout/minitest' if defined? Minitest
          end
        else
          ActiveSupport.on_load :active_support_test_case do
            require 'roundabout/monkey/capybara'
            require 'roundabout/rspec' if defined? RSpec
            require 'roundabout/minitest' if defined? Minitest
          end
        end

        ActiveSupport.on_load :action_controller do
          require 'roundabout/monkey/action_controller'
        end
      end

      config.after_initialize do |app|
        if Rails.env.development?
          app.routes.append do
            mount Roundabout::Engine => '/roundabout'
          end
        end
      end
    end
  end
end
