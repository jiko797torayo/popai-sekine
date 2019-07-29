Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    confirmations:      'users/confirmations'
  }

  namespace :users do
    root to: 'records#index'
    resources :dashboards, only: :index
    resources :records
    resources :client_records, only: [:index, :show]
    resources :parts, only: [] do
      resources :exercises, only: :index
    end
    resources :trainer_requests, only: [:new, :create] do
      collection do
        get :confirm
        patch :accept
      end
    end
  end

  namespace :admins do
    root to: 'dashboards#index'
    resources :exercises
    resources :parts
  end

  get '/health', controller: :elb, action: :health
  root to: 'users/records#index'
end
