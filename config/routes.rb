Rails.application.routes.draw do
  resources :products
  devise_for :users
  root 'groups#index'

  #こいつ怪しい⇩
  # resources :group_messages, only: [:new, :create]
  
  # :indexを追記
  resources :users, only: [:index, :edit, :update]
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages
  end
end