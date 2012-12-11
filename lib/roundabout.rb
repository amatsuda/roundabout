require 'roundabout/version'
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
end
