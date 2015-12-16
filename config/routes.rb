Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users

  namespace :admin do
    resources :welcomes, only: [:index]
    resources :categories
    resources :brands
    resources :products
    resources :carts

    get "/" => "welcomes#index"
  end

  resources :categories, only: [:show]
end
