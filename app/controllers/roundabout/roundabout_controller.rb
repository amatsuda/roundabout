require 'pp'
require 'roundabout/application_controller'

module Roundabout
  class RoundaboutController < ::Roundabout::ApplicationController
    def index
      @transitions = if (json = Rails.root.join('doc/roundabout.json')).exist?
        ActiveSupport::JSON.decode json.read
      else
        []
      end
    end
  end
end
