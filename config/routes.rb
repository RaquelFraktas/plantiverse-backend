Rails.application.routes.draw do
  # resources :forum_topics, only: [:create, :show, :index]
  resources :user_plants
  resources :comments, only: [:create, :index]
  resources :users, only: [:create, :update, :show, :index]
  resources :plants, only: [:index, :show]
  # resources :user_plants, only: [:delete]

  post "/login", to: "sessions#create"
  get "/me", to: "sessions#autologin"
  get "/message_boards", to: "forum_topics#index"
  get "/message_boards/:id", to: "forum_topics#show"
  post "/message_boards", to: "forum_topics#create"
  get "/message_boards/:id/comments", to: "comments#index"
  post "/message_boards/:id/comments", to: "comments#create"
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
