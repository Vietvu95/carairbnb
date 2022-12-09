Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  resources :cars do
    resources :bookings
    resources :reviews, only: %i[new create]
  end
  resources :bookings, :reviews, only: [:destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
