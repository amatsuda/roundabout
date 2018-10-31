# frozen_string_literal: true

require 'roundabout/version'
require 'roundabout/railtie'
require 'roundabout/recorder'

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

  def self.save_results
    transitions = compile_page_transitions
    Rails.root.join('tmp/roundabout.json').open('w') {|f| f.write transitions.to_json} unless transitions.empty?
  end
end
