Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require "sidekiq/web"
  authenticate :admin_user do
    mount Sidekiq::Web => "/sidekiq"
  end

  root to: 'pages#home'
  get "stats", to: 'pages#stats'
  get "accessibilite", to: 'pages#accessibilite'
  get "politique_confidentialite", to: 'pages#politique_confidentialite'
  get "conditions_generales", to: 'pages#conditions_generales'
  get "mentions_legales", to: 'pages#mentions_legales'
  get "ajouter-ressources", to: 'pages#ajouter_ressources'
  get "proposer-aide", to: 'pages#proposer_aide'
  get "entraide", to: 'pages#entraide'
  get "infographie", to: 'pages#infographie'

  resources :contacts, only: :create
  post "contact/newsletter", to: "contacts#create_newsletter", as: "create_newsletter"
  get "/helps/confirm", to: "helps#confirm"
  get "aides/ajouter-aide", to: "helps#new"
  resources :helps, only: [:show, :index, :create], path: "aides" do
    resources :reviews, only: [:index, :create, :new]
    resources :evaluation_helps, only: [:index, :create, :new]
  end

  resources :case_reviews, only: [:create, :edit], path: "revue-dossier"
  patch "case_reviews/:id", to: "case_reviews#review_case", as: "case_review"
  get "/revue-dossier/confirmation", to: "case_reviews#confirmation"
  get "/revue-dossier/revue", to: "case_reviews#already_reviewed"
  get "organisation/confirm", to: "organizations#confirm", as: "confirm_organization"
  get "organisation/:id/chiffres_prix", to: "organizations#renseigner_prix", as: "renseigner_prix"
  post "organisation/:id/chiffres_prix", to: "organizations#create_prix", as: "create_prix"

  resources :organizations, only: [:new, :create, :index, :show, :edit, :update], path: "index-parite" do
    resources :chiffres_organizations, only: [:new, :create, :edit, :update]
  end
  resources :notation_helps, only: :create
  get "/ressources", to: "conseils_pratiques#index"
  resources :conseils_videos, only: [:show]
  resources :conseils_articles, only: [:show]
  resources :notification_helps, only: :create
  resources :notation_conseils_articles, only: :create
  resources :notation_conseils_videos, only: :create
  resources :notation_catalogues, only: :create
  get '/renseigner-index', to: "organizations#renseigner_index"

  # REDIRECTIONS
  get '/helps', to: redirect('/aides')
  get '/helps/new', to: redirect('/aides/ajouter-aide')
  get '/helps/confirm', to: redirect('/aides/confirmation')
  get '/helps/:id', to: redirect('/aides/%{id}')
  get '/conseils', to: redirect('/ressources')
  get '/proposer_conseil', to: redirect('/ajouter-ressources')
  get '/rencontre', to: redirect('/entraide')
  get '/organizations', to: redirect('/index-parite')
  get '/organizations/new', to: redirect('/renseigner-chiffres')
end
