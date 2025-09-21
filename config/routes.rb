# Rails.application.routes.draw do
#   # Login
#   post '/login', to: 'sessions#create'

#   # Users and their cats
  
#     resources :cats do
#       resources :food_entries, only: [:index, :create, :show, :update, :destroy]
#       resources :activity_entries, only: [:index, :create, :show, :update, :destroy]
#     end
#   end
Rails.application.routes.draw do
  # Login
  post '/login', to: 'sessions#create'

  # Users
  resources :users, only: [:create]

  # Users' cats and their entries
  resources :cats do
    resources :food_entries, only: [:index, :create, :show, :update, :destroy]
    resources :activity_entries, only: [:index, :create, :show, :update, :destroy]
  end
end


