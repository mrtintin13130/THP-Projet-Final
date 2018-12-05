Rails.application.routes.draw do

	root 'home#index'
	resources :messages
	devise_for :users
	resources :users
	resources :articles

	as :user do
		get 'users/profile', :to => 'devise/registrations#edit', :as => :user_root
	end
	>>>>>>> 6769605d02284e2ff4aafc4c0c73b57e9ff2c41d
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
