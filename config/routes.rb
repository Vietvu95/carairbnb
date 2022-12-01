Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
<<<<<<< HEAD
  resources :cars do

  end
=======
  resources :cars, :bookings
>>>>>>> 9528a0088111c02b34137d90ce8ae1a972e08d4d
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
