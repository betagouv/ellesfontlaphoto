Rails.application.routes.draw do
  get 'conseils_articles/show'
  get 'conseils_videos/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#home'
  get "mentions_legales", to: 'pages#mentions_legales'
  get "donnees_personelles", to: 'pages#donnees_personelles'
  get "a_propos", to: 'pages#a_propos'
  get "stats", to: 'pages#stats'
  get "stats", to: 'pages#stats'
  get "proposer_conseil", to: 'pages#proposer_conseil'
  get "proposer_aide", to: 'pages#proposer_aide'

  resources :contacts, only: :create
  resources :helps, only: [:show, :index] do
    resources :reviews, only: [:index, :create, :new]
    resources :evaluation_helps, only: [:index, :create, :new]
  end
  resources :notation_helps, only: :create
  get "/conseils", to: "conseils_pratiques#index"
  resources :conseils_videos, only: [:show]
  resources :conseils_articles, only: [:show]
  resources :notification_helps, only: :create
  resources :notation_conseils_articles, only: :create
  resources :notation_conseils_videos, only: :create
  resources :notation_catalogues, only: :create
end
