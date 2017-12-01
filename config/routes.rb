Rails.application.routes.draw do
  resources :experiences do
     resources :reviews, only: :create
     resources :trips
  end

  devise_for :users, class_name: 'FormUser',
    :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  root to: 'pages#home'

  resources :conversations do
    resources :messages
  end

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  resources :profiles, only: [:show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  mount Attachinary::Engine => "/attachinary"
  mount ActionCable.server => '/cable'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
