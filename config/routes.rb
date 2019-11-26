Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
