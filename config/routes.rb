Rails.application.routes.draw do
  resources :labels
  root to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
  namespace :admin do
    resources :users
  end
end
