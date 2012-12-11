require 'roundabout/version'
require 'roundabout/railtie'
require 'roundabout/recorder'
require 'roundabout/monkey/capybara'

module Roundabout
  def self.record_transition(from, to, method, type)
    recorder.record_transition from, to, method, type
  end

  def self.recorder
    @recorder ||= Recorder.new
  end

  def self.compile_page_transitions
    recorder.transitions
  end

  def self.normalize_url(path, method = nil)
    h = Rails.application.routes.recognize_path(path, method: method)
    "#{h[:controller]}##{h[:action]}"
  end
end
