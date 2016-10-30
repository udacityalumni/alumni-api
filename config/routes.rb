require 'gollum'

Rails.application.routes.draw do
  devise_for :users
  # Bootstrap graphql and the graphiql editor
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  root to: redirect('/graphiql')
  resources :graphql

  #  get '/wiki', to: redirect("http://0.0.0.0:4567"), as: :wiki

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
      resources :tags, only: [:index, :show, :create, :update, :destroy]
      resource :users, only: [:show, :create, :update]
      resource :sessions, only: [:create, :destroy]
      resources :spotlight_images, only: [:index, :create, :destroy]

      scope :auth do
        get 'is_signed_in', to: 'auth#is_signed_in?'
      end
    end
  end
end
