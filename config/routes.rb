Rails.application.routes.draw do

  resources :profile, only: [:edit, :update, :show]

  mount Attachinary::Engine => "/attachinary"

  resources :appointments, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    get 'confirm', to:"appointments#confirm"
    get 'decline', to:"appointments#decline"
  end

  resources :artworks do
      resources :appointments, only: [:new,:create]
  end

  resources :venues

  devise_for :users,

    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "search", to: 'artworks#search'

# mailbox folder routes Mailboxertest
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

# conversations
  resources :conversations do #Mailboxertest
    member do#Mailboxertest
      post :reply#Mailboxertest
      post :trash#Mailboxertest
      post :untrash#Mailboxertest
    end#Mailboxertest
end#Mailboxertest
end

