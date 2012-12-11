Roundabout::Engine.routes.draw do
  get '/' => 'roundabout#index'
  root :to => 'roundabout#index'
end
