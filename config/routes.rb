Rails.application.routes.draw do
  get 'conseils_articles/show'
  get 'conseils_videos/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get "mentions_legales", to: 'pages#mentions_legales'
  get "a_propos", to: 'pages#a_propos'
  resources :contacts, only: :create
  resources :helps, only: [:show, :index]
  resources :notation_helps, only: :create
  get "/conseils", to: "conseils_pratiques#index"
  resources :conseils_videos, only: [:show]
  resources :conseils_articles, only: [:show]
  resources :notation_conseils_articles, only: :create
  resources :notation_conseils_videos, only: :create
end
