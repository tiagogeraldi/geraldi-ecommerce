Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, path_prefix: 'login'

  namespace :admin do
    resources :welcomes, only: [:index]
    resources :categories
    resources :brands
    resources :products
    resources :carts, only: [:index, :edit]
    resources :customers, only: [:index, :edit]
    resources :settings
    resources :users
    
    get "/" => "welcomes#index"
  end

  resources :categories, only: [:show]
  resources :brands, only: [:show]
end
