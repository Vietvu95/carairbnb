Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: %i[:new :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
