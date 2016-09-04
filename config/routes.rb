require 'api_constraints'

Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  namespace :api, default: {format: :json} do
    namespace :v1 do
      scope constraints: ApiConstraints.new(version: 1.0, default: true) do
        resources :users, only: [:create]
        resources :bookmarks, only: [:create, :destroy]
      end
    end
  end 

  resources :users, only: [:show]
  resources :articles, only: [:index, :show]

  root to: "home#index"
end
