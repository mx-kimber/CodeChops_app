Rails.application.routes.draw do
  # get "/chops" => "chops#index"

  resources :chops
  resources :categories


  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
