Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users

  resources :missions
  resources :users, only: [:index, :show, :update, :destroy]
end
