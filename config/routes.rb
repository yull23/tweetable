Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"
  resources :tweets
  resources :users
  get "/users/:id/likes", to: "users#show_likes", as: :show_user_likes

  get "/login", to: "sessions#new", as: :login_path
  post "/login", to: "sessions#create"
end
