Roundabout::Engine.routes.draw do
  get '/' => 'roundabout#index', as: 'root'
end
