# frozen_string_literal: true

RSpec.configure do |config|
  config.after :suite do
    Roundabout.save_results
  end
end
