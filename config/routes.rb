Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # tell Rails to use devise session controller
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :routines
  resources :workouts
  resources :exercises
  resources :diets
  resources :recipes
  resources :foods
  
end
