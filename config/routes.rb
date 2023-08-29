Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :houses do
    member do
      post :toggle_favourites
    end
    resources :offers, only: %i[index create]
  end
  resources :offers, only: [:destroy]
  resources :favourites, only: :index
end
