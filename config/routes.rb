Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movements do
    resources :bathrooms, only: [ :new, :create ]
    collection do
    get "charts", to: "movements#charts"
  end
  end
  resources :meals
  resources :bathrooms, except: [ :new, :create ] do
    resources :reviews, only: [ :new, :create ]
  end



  get '/dashboard', to: 'users#dashboard'
  get '/profile', to: 'users#profile'
  patch '/:id', to: 'users#update'
  get '/dashboard' => "welcome#index", :as => :user_root
end
