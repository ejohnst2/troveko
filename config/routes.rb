Rails.application.routes.draw do
  resources :experiences do
     resources :reviews, only: :create
     resources :trips do
      member do
        get 'confirmation', to: "trips#confirmation"
      end
    end
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :conversations do
    resources :messages
  end

  mount Attachinary::Engine => "/attachinary"

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
