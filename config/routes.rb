Rails.application.routes.draw do

  get 'home/index'
  devise_for :users
  resources :users

  resources :categories do
    resources :transactions
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'home#index'
  end


end
