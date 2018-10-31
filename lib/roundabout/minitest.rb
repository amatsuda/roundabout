# frozen_string_literal: true

Minitest.after_run do
  Roundabout.save_results
end
