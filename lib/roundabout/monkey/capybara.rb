require 'capybara'

class Capybara::RackTest::Browser
  def follow_with_recording(method, path, attributes = {})
    return if path.gsub(/^#{request_path}/, '').start_with?('#')
    begin
      Roundabout.record_transition Roundabout.normalize_url(URI.parse(driver.current_url).path), Roundabout.normalize_url(path, method), method, :link
    rescue => e
      p e
    end

    follow_without_recording method, path, attributes
  end
  alias_method_chain :follow, :recording

  def submit_with_recording(method, path, attributes)
    begin
      p = (path.nil? || path.empty?) ? request_path : path
      m = attributes['_method'] || method
      Roundabout.record_transition Roundabout.normalize_url(URI.parse(driver.current_url).path), Roundabout.normalize_url(p, m), m, :form
    rescue => e
      p e
    end

    submit_without_recording method, path, attributes
  end
  alias_method_chain :submit, :recording
end
