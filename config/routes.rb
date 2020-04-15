# frozen_string_literal: true

Rails.application.routes.draw do
  resources :labels
  root to: 'sessions#new'
  resources :sessions, only: %i[new create destroy new_guest] do
    collection do
      post :new_guest, as: 'guest_sign_in'
    end
  end
  resources :users
  resources :tasks
  namespace :admin do
    resources :users
  end
end
