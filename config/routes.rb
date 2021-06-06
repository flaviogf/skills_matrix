Rails.application.routes.draw do
  root "sessions#new"

  resources :skills
  resources :teams
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :user_profiles, only: [:index]
end
