Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :create, :destroy]
  resources :tags, only: [:index, :show]
  resources :mentions, only: [:index, :show]
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  resources :tweets do
    member do
        post :retweet
    end
  end
end
