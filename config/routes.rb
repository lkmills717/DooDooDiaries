Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movements
  resources :meals

  namespace :charts do
    get 'new-users'
  end


  get '/dashboard', to: 'users#dashboard'
  get '/profile', to: 'users#profile'
  get '/dashboard' => "welcome#index", :as => :user_root
end
