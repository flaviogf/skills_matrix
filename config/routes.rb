Rails.application.routes.draw do
  resource :sessions, only: [:new, :create, :destroy]
  resources :skills
end
