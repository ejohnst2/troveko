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

  resources :trips, only: [:edit, :update, :destroy, :show, :index] do
    resources :contributions, only: :create
    patch 'status', to: "trips#status"
    patch 'cancel', to: "trips#cancel"
  end
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :conversations do
    resources :messages
  end

  resources :profiles, only: [:show]
  resources :orders, only: [:show, :create] do
    get 'payments/capture', to: "payments#capture"
    resources :payments, only: [:new, :create]
  end


  mount Attachinary::Engine => "/attachinary"
  mount ActionCable.server => '/cable'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
