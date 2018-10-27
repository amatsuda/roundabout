require 'capybara'

module Roundabout
  module Capybara
    module RackTest
      module Browser
        def follow(method, path, attributes = {})
          return if path.gsub(/^#{request_path}/, '').start_with?('#')
          begin
            Roundabout.record_transition Roundabout.normalize_url(URI.parse(driver.current_url).path), Roundabout.normalize_url(path, method), method, :link
          rescue => e
            p e
          end

          super
        end

        def submit(method, path, attributes)
          begin
            p = (path.nil? || path.empty?) ? request_path : path
            m = attributes['_method'] || method
            Roundabout.record_transition Roundabout.normalize_url(URI.parse(driver.current_url).path), Roundabout.normalize_url(p, m), m, :form
          rescue => e
            p e
          end

          super
        end
      end
    end
  end
end

::Capybara::RackTest::Browser.prepend Roundabout::Capybara::RackTest::Browser
