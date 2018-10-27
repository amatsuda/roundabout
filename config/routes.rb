# frozen_string_literal: true

Roundabout::Engine.routes.draw do
  get '/(.:format)' => 'roundabout#index'
end
