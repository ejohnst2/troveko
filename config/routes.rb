Rails.application.routes.draw do
  resources :experiences do
     resources :reviews, only: :create
     resources :trips
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
