# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  get 'home/404_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Nykyta McDonald - addition
  # My Routes
  # Routes for Home controller actions
  root 'home#index'
  get 'about', to: 'home#about'
  get 'search', to: 'home#search'
  get 'result', to: 'home#result'
  get 'popup', to: 'home#popup'
  get 'faq', to: 'home#faq'
  get 'profile', to: 'home#profile'

  # Routes for User actions
  resources :users
  get 'signup', to: 'users#signup'
  get 'edit', to: 'home#edit'

  # Routes for Session actions
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout

  # Routes for Lists and Cards
  resources :lists, only: %i[index show create destroy]

  resources :cards, only: %i[create destroy]

  # Route for unknown paths to handle 404 errors
  match '*path', to: 'home#page_404', via: :all

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
