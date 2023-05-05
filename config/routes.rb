Rails.application.routes.draw do
  root 'chops#index'

  resources :chops
  resources :categories do
    resources :user_chops
  end
  resources :user_chops, only: [:create, :show, :update]

  resources :users

  get '/user_chops' => 'user_chops#index'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end

