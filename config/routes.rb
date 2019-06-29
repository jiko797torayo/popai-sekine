Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }


  get '/health', controller: :elb, action: :health
  root to: 'welcome#index'

  namespace :admins do
    root to: 'dashboards#index'
    resources :exercises
  end
end
