Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :funds do
  end

  resources :experiences do
     resources :reviews, only: :create
     resources :trips, only: [:new, :create] do
      member do
        get 'confirmation', to: "trips#confirmation"
      end
    end
  end

  get '/about', to: 'pages#about'

  devise_for :users, class_name: 'FormUser',
    :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  resources :trips, only: [:edit, :update, :destroy, :show, :index] do
    resources :contributions, only: :create
    patch 'status', to: "trips#status"
    patch 'cancel', to: "trips#cancel"
  end

  resources :conversations do
    resources :messages
  end

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  resources :profiles, only: [:show]
  resources :orders, only: [:show, :create] do
    get 'payments/capture', to: "payments#capture"
    resources :payments, only: [:new, :create]
  end


  mount Attachinary::Engine => "/attachinary"
  mount ActionCable.server => '/cable'

  root to: 'pages#home'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
