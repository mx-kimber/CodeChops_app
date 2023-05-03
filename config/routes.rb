Rails.application.routes.draw do
  root "chops#index"

  resources :chops
  resources :categories do
    resources :user_chops
  end
  resources :user_chops

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
