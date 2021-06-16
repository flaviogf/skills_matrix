Rails.application.routes.draw do
  root to: 'developers#new'

  resource :sessions, only: [:new, :create, :destroy]
  resources :skills
  resources :developers
  resource :matrices, only: [:show]
end
