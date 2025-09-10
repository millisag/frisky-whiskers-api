Rails.application.routes.draw do
  # get "sessions/create"
  # get "users/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post '/login', to: 'sessions#create'
  resources :users do
    resources :users, only: [:create, :show, :update, :destroy]
  end

  resources :cats, only: [:index, :show, :create, :update, :destroy] do
    resources :food_entries, only: [:index, :create, :show, :update, :destroy]
    resources :activity_entries, only: [:index, :create, :show, :update, :destroy]
  end
end
