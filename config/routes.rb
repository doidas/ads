Rails.application.routes.draw do
  get 'users/index'

	devise_for :users, :controllers => { :registrations => 'users/registrations' }
	devise_scope :user do  
	   get '/users/sign_out' => 'devise/sessions#destroy'  
	end

	get 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
	get 'users/:id' => 'users#show', as: :user
	resources :users

  root 'pages#index'
  #root to: "pages#index"
end
