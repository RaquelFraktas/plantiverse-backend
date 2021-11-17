Rails.application.routes.draw do
  resources :comments
  resources :forum_topics
  resources :user_plants
  resources :users, only: [:create, :update, :show, :index]
  resources :plants, only: [:index, :show]

  post "/login", to: "sessions#create"
  get "/me", to: "sessions#autologin"
  get "/message_boards", to: "forumtopics#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
