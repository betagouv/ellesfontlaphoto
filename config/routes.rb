Rails.application.routes.draw do
  get 'conseils_articles/show'
  get 'conseils_videos/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require "sidekiq/web"
  if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'
  get "stats", to: 'pages#stats'
  get "accessibilite", to: 'pages#accessibilite'
  get "politique_confidentialite", to: 'pages#politique_confidentialite'
  get "conditions_generales", to: 'pages#conditions_generales'
  get "mentions_legales", to: 'pages#mentions_legales'
  get "ajouter-ressources", to: 'pages#ajouter_ressources'
  get "proposer-aide", to: 'pages#proposer_aide'
  get "renseigner-chiffres", to: 'pages#renseigner_chiffres'
  get "entraide", to: 'pages#entraide'
  get "infographie", to: 'pages#infographie'

  resources :contacts, only: :create
  post "contact/newsletter", to: "contacts#create_newsletter", as: "create_newsletter"
  get "/helps/confirm", to: "helps#confirm"
  get "/organizations/:id/add_request_info", to: "organizations#add_request_info"
  get "aides/ajouter-aide", to: "helps#new"
  resources :helps, only: [:show, :index, :create], path: "aides" do
    resources :reviews, only: [:index, :create, :new]
    resources :evaluation_helps, only: [:index, :create, :new]
  end

  resources :case_reviews, only: [:create, :edit], path: "revue-dossier"
  patch "case_reviews/:id", to: "case_reviews#review_case", as: "case_review"
  get "/revue-dossier/confirmation", to: "case_reviews#confirmation"
  get "/revue-dossier/revue", to: "case_reviews#already_reviewed"
  resources :organizations, only: [:index], path: "index-parite"
  resources :notation_helps, only: :create
  get "/ressources", to: "conseils_pratiques#index"
  resources :conseils_videos, only: [:show]
  resources :conseils_articles, only: [:show]
  resources :notification_helps, only: :create
  resources :notation_conseils_articles, only: :create
  resources :notation_conseils_videos, only: :create
  resources :notation_catalogues, only: :create

  # REDIRECTIONS
  get '/helps', to: redirect('/aides')
  get '/helps/new', to: redirect('/aides/ajouter-aide')
  get '/helps/confirm', to: redirect('/aides/confirmation')
  get '/helps/:id', to: redirect('/aides/%{id}')
  get '/conseils', to: redirect('/ressources')
  get '/proposer_conseil', to: redirect('/ajouter-ressources')
  get '/rencontre', to: redirect('/entraide')
  get '/organizations', to: redirect('/index-parite')
end
