RSpec.configure do |config|
  config.after :suite do
    transitions = Roundabout.compile_page_transitions
    Rails.root.join('tmp/roundabout.json').open('w') {|f| f.write transitions.to_json} unless transitions.empty?
  end
end
