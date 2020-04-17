Rails.application.routes.draw do
  root 'home#index'

  post '/', to: 'volunteers#create' # POST /#apply for the volunteer form on the root

  resources :cities, only: :index
  resources :states, only: :index

  resources :partners, only: [:index, :create]

  namespace :api do
    post '/hospital', to: 'hospitals#create'
  end

  get '/hospitals', to: 'hospitals#index'

  get '/privacy', to: 'pages#privacy'

  scope "(:locale)", locale: /en|ja/ do
    resources :guidelines, only: %I(index)
    get "/guidelines/:category_name", to: "guideline_categories#index"
  end
end
