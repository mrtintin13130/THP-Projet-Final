Rails.application.routes.draw do
 root to: 'articles#index'
	resources :home
resources :articles
resources :products
  resources :messages
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
