Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
  resources :skills
  resource :dashboards, only: [:show]
end
