Rails.application.routes.draw do
  devise_for :users

  root "users#new"
  get "/home/about" => "books#new"

  resources :users, only: [:index, :show, :edit, :new, :update, :destroy] 
  resources :books, only: [:create, :index, :show, :new, :edit, :destroy, :update]
end