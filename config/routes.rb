Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'sessions/index'
  get 'page/home'
  get 'registrations/new'
  get 'registrations/create'
  get 'registrations/edit'
  get 'registrations/update'
  get 'registrations/destroy'
  get 'produits/index'
  get 'produits/show'
  get 'produits/new'
  get 'produits/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "page#home"

  resources :users, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  resources :produits, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]


  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'produits', to: 'produits#new'
  post 'produits', to: 'produits#create'

  get 'login', to: 'sessions#index'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  get 'make_admin_form', to: 'users#new'
  get 'admin_form', to: 'users#make_admin_form'
  patch 'make_admin', to: 'users#makeAdmin'

  # get 'make_admin_form', on: :member  # Affiche le formulaire pour rendre l'utilisateur admin
  # patch 'make_admin', on: :member     # Mets à jour l'utilisateur pour le rendre admin
  
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
  # get 'produits', to: 'produits#edit'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
