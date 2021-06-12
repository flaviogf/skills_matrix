Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :skills
end
