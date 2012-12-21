Roundabout::Engine.routes.draw do
  get '/(.:format)' => 'roundabout#index', as: 'root'
end
