Rails.application.routes.draw do
  resources :user_plants
  resources :users, only: [:create, :update]
  resources :plants, only: [:index, :show]

  post "/login", to: "sessions#create"
  get "/me", to: "sessions#autologin"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
