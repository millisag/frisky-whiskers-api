Rails.application.routes.draw do
  # Login
  post '/login', to: 'sessions#create'

  # Users and their cats
  resources :users, only: [:create, :show, :update, :destroy] do
    resources :cats, only: [:index, :show, :create, :update, :destroy] do
      resources :food_entries, only: [:index, :create, :show, :update, :destroy]
      resources :activity_entries, only: [:index, :create, :show, :update, :destroy]
    end
  end
end

