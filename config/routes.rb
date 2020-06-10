Rails.application.routes.draw do
  resources :psychology_tasks
  resources :physio_exercises
  resources :tasks
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

   # Specific routes for professionals? 
  resources :professionals, controller: 'users', type: 'Professional' do

  end

  resources :clients, controller: 'users', type: 'Client' do
    
  end

  resources :users do
    resources :clients, controller: 'users', type: 'Client' do
      resources :routines
      resources :diets
      resources :psychology_tasks
      resources :physio_exercises
      resources :appointments
      resources :contracts
      resources :measurements
    end
    resources :measurements
    resources :routines
    resources :workouts
    resources :exercises
    resources :diets
    resources :meals
    resources :foods
    resources :psychology_tasks
    resources :physio_exercises
    resources :appointments
    resources :contracts
  end
  resources :routines
  resources :workouts
  resources :exercises
  # resources :diets
  resources :meals
  resources :foods
  resources :psychology_tasks
  resources :physio_exercises
  resources :appointments
  resources :contracts
  
end
