Rails.application.routes.draw do
  root "sessions#new"

  resources :skills
  resources :teams
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new]
end
