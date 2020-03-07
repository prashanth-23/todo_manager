Rails.application.routes.draw do
  resources :todos
  post "users/:id/login", to: "users#check"
  resources :users
end
