Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root 'home#index'

    post '/', to: 'volunteers#create' # POST /#apply for the volunteer form on the root

    resources :cities, only: :index
    resources :states, only: :index

    resources :partners, only: [:index, :create]

    namespace :api do
      post '/hospital', to: 'hospitals#create'
    end

    get '/hospitals', to: 'hospitals#index'

    get '/about', to: 'pages#about'
    get '/terms', to: 'pages#terms'
    get '/privacy', to: 'pages#privacy'

    get "/guidelines", to: "guidelines#index"
    get "/guidelines/:category_slug", to: "guidelines#index", as: "guideline_category"
    get "/guidelines/:category_slug/:article_slug", to: "guidelines#index", as: "guideline_article"
    # get "/guidelines/:category", to: "guideline_categories#index", as: "guideline_category"
    # get "/guidelines/:category/:article", to: "guideline_articles#index", as: "guideline_article"
  end
end
