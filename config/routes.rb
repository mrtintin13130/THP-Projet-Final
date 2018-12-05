Rails.application.routes.draw do

	root 'home#index'
	devise_for :users
	resources :users
	resources :messages


	as :user do
		get 'users/profile', :to => 'devise/registrations#edit', :as => :user_root
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
