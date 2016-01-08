Rails.application.routes.draw do
  devise_for :customers
  root to: 'visitors#index'

  devise_for :users, path_prefix: 'login'

  namespace :admin do
    resources :welcomes, only: [:index]
    resources :categories
    resources :brands
    resources :products do
      get :autocomplete_brand_name,    on: :collection
      get :autocomplete_category_name, on: :collection
    end
    resources :orders
    resources :carts, only: [:index, :edit]
    resources :customers
    resources :settings
    resources :users
    
    get "/" => "welcomes#index"
  end

  namespace :customer do
    resources :orders, only: [:index]
  end

  resources :categories, only: [:show]
  resources :brands, only: [:show]
end
