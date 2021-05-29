Rails.application.routes.draw do
  root "skills#index"

  resources :skills
  resources :teams
end
