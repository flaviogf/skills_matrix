Rails.application.routes.draw do
  root "skills#index"

  resources :skills
  resources :teams
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new]
end
