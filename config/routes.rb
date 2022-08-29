Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"
  resources :users, except: [:index, :new]
  resources :sessions, except:[:index, :edit, :update, :show, :new, :destroy]
  root "people#index"

  resources :people do
    resources :numbers
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
