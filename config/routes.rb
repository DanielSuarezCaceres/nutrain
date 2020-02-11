Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
      registration: 'users/registrations'
  }

  resources :users
  resources :routines
  resources :workouts
  resources :exercises
  resources :diets
  resources :recipes
  resources :foods
  
end
