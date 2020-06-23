Rails.application.routes.draw do

    devise_for :users
	root 'home#index'
	get "about" => "home#about"
	resources :users, only:[:index, :show, :edit, :update]
    resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
