require 'capybara'

module Roundabout
  module Capybara
    module Node
      module Element
        def click(*keys, **offset)
          path_from = session.current_path
          case tag_name
          when 'input'
            type = :form
            form = ancestor 'form'
            path_to = form[:action]
            method = form[:method]
            begin
              method = form.first('input[type=hidden][name=_method]', visible: false).value
            rescue ::Capybara::ExpectationNotMet
            end
          when 'a'
            type = :link
            path_to = self[:href]
            method = self[:'data-method'] || :get
          end

          ret = super

          if path_from != path_to
            begin
              Roundabout.record_transition Roundabout.normalize_url(path_from), Roundabout.normalize_url(path_to, method), method, type
            rescue => e
              p e
            end
          end
          ret
        end
      end
    end

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

::Capybara::Node::Element.prepend Roundabout::Capybara::Node::Element
::Capybara::RackTest::Browser.prepend Roundabout::Capybara::RackTest::Browser
