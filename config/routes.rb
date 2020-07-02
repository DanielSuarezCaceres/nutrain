Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :professionals, controller: 'users', type: 'Professional', only: %i[index show]
  resources :clients, controller: 'users', type: 'Client', only: %i[index show]

  resources :users do
    resources :clients, only: %i[index show], controller: 'users', type: 'Client' do
      resources :routines
      resources :diets
      resources :psychology_tasks
      resources :physio_exercises
      resources :appointments
      resources :measurements
    end
    resources :measurements do
      collection do
        get 'delete_all'
      end
    end
    resources :routines do
      collection do
        get 'delete_all'
      end
    end
    resources :workouts do
      collection do
        get 'delete_all'
      end
    end
    resources :exercises do
      collection do
        get 'delete_all'
      end
    end
    resources :diets do
      collection do
        get 'delete_all'
      end
    end
    resources :meals do
      collection do
        get 'delete_all'
      end
    end
    resources :foods do
      collection do
        get 'delete_all'
      end
    end
    resources :psychology_tasks do
      collection do
        get 'delete_all'
      end
    end
    resources :physio_exercises do
      collection do
        get 'delete_all'
      end
    end
    resources :appointments do
      collection do
        get 'delete_all'
      end
    end
    resources :contracts do
      collection do
        get 'delete_all'
      end
    end
  end

  resources :contacts, only: %i[new create]
  
end
