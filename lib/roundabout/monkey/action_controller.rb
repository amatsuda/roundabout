module ActionController
  module Redirecting
    def redirect_to_with_recording(options = {}, response_status = {})
      redirect_to_without_recording options, response_status
      begin
        h = @_request.env['action_dispatch.request.path_parameters'].with_indifferent_access
        Roundabout.record_transition "#{h[:controller]}##{h[:action]}", Roundabout.normalize_url(self.location), :get, :redirect
      rescue => e
        p e
      end
    end
    alias_method_chain :redirect_to, :recording
  end
end
