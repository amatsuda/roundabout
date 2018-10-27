# frozen_string_literal: true

module Roundabout
  module ActionController
    module Redirecting
      def redirect(options = {}, response_status = {})
        super

        begin
          h = @_request.env['action_dispatch.request.path_parameters'].with_indifferent_access
          Roundabout.record_transition "#{h[:controller]}##{h[:action]}", Roundabout.normalize_url(self.location), :get, :redirect
        rescue => e
          p e
        end
      end
    end
  end
end

::ActionController::Redirecting.prepend Roundabout::ActionController::Redirecting
