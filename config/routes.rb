Rails.application.routes.draw do
  get "/", to: "home#index"
  resources :todos
  post "users/login", to: "users#check"
  resources :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
