Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  resources :cars do
    resources :bookings, only: %i[index new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, :reviews, only: %i[destroy show index edit update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "dashboard#dashboard", as: :dashboard
end
