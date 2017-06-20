Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  resources :appointments, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :artworks do
      resources :appointments, only: [:new,:create]
  end


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
    resources :venues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "search", to: 'artworks#search'
end
