# frozen_string_literal: true

module Roundabout
  module ActionController
    module Redirecting
      def redirect_to(*)
        ret = super

        begin
          h = @_request.env['action_dispatch.request.path_parameters'].with_indifferent_access
          Roundabout.record_transition "#{h[:controller]}##{h[:action]}", Roundabout.normalize_url(self.location), :get, :redirect
        rescue => e
          p e
        end
        ret
      end
    end
  end
end

::ActionController::Base.prepend Roundabout::ActionController::Redirecting
