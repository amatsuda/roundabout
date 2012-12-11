require 'rails'
require 'roundabout/engine'

module Roundabout
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'roundabout' do |app|
      ActiveSupport.on_load(:after_initialize) do
        if Rails.env.development?
          Rails.application.routes.append do
            mount Roundabout::Engine, :at => '/roundabout'
          end
        end
      end
    end
  end
end
