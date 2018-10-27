# frozen_string_literal: true

require 'set'

module Roundabout
  class Recorder
    attr_reader :transitions

    def initialize
      @transitions = Set.new
    end

    def record_transition(from, to, method, type)
      @transitions << {from: from, to: to, method: method, type: type}
    end
  end
end
