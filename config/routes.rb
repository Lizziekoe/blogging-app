Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: 'posts#index'

  
  resources :users
  resources :posts do
  	resources :comments, :except => [:show, :index]
	end
end
