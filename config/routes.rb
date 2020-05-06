Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
      registration: 'users/registrations'
  }

  resources :professionals, controller: 'users', type: 'Professional' do

  end

  resources :clients, controller: 'users', type: 'Client' do
    
  end

  resources :users do
    resources :clients, controller: 'users', type: 'Client' do
      resources :routines
      resources :diets
    end
    resources :routines
    resources :workouts
    resources :exercises
    resources :diets
    resources :meals do
      collection do
        get :download_report
      end
    end
    resources :foods
    resources :appointments
    resources :contracts
  end
  resources :routines
  resources :workouts
  resources :exercises
  resources :diets
  resources :meals
  resources :foods
  resources :appointments
  resources :contracts
  
end
