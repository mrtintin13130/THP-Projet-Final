Rails.application.routes.draw do

	root 'home#index'
	resources :messages
	devise_for :users
	resources :users
  resources :articles do
  	resources :likes
  end
	resources :exchanges
	resources :favorites
	get 'new_favorite', :to => 'favorites#new_favorite', :as => "add_favorite"

	as :user do
		get 'users/profile', :to => 'devise/registrations#edit', :as => :user_root
	end
	get "verification_number", to: "users#verification_number"
	post "verification_number", to: "users#new_verification_number"
	resources :charges, only: [:new, :create, :confirm_page]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
