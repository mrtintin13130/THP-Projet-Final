Rails.application.routes.draw do

	root 'home#index'

	devise_for :users
	resources :users
	resources :articles do
		resources :likes
	end
	resources :exchanges
	resources :favorites

	resources :conversations, only: [:index, :create] do
		resources :messages, only: [:index, :create]
	end
	get 'new_favorite', :to => 'favorites#new_favorite', :as => "add_favorite"
	get "verification_number", to: "users#verification_number"
	post "verification_number", to: "users#new_verification_number"
	resources :charges, only: [:new, :create, :confirm_page]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
