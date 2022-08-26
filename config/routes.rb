Rails.application.routes.draw do

  root "people#index"

  resources :people do
    resources :number
    resources :emails
    resources :addresses
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
