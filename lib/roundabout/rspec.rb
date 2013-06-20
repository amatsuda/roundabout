RSpec.configure do |config|
  config.after :suite do
    transitions = Roundabout.compile_page_transitions
    unless transitions.empty?
      Dir.mkdir Rails.root.join('doc')
      Rails.root.join('doc/roundabout.json').open('w') {|f| f.write transitions.to_json}
    end
  end
end
