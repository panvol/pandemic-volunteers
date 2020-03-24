Rails.application.routes.draw do
  root 'home#index'

  post '/', to: 'volunteers#create' # POST /#apply for the volunteer form on the root

  resources :cities, only: :index
  resources :states, only: :index
end
