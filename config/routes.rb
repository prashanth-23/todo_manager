Rails.application.routes.draw do
  get "/", to: "home#index"
  resources :todos
  post "users/login", to: "users#check"
  resources :users
end
