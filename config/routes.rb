Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "home#index"
	resources :users
  	get 'password_resets/new'
  	resources :password_resets
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	get "/auth/google_oauth2/callback" => "users#google_oauth2"
end
