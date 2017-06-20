Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  resources :appointments, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :artworks
  resources :venues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
