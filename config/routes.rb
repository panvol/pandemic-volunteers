Rails.application.routes.draw do
  root 'home#index'

  resources :volunteers

  resources :cities, only: :index
  resources :states, only: :index
end
