class Help < ApplicationRecord

  has_one :notation_help
  has_many :candidature_dates, dependent: :destroy
  has_many :notification_helps
  has_many :reviews
  has_many :evaluation_helps
  accepts_nested_attributes_for :candidature_dates, allow_destroy: true

  acts_as_taggable_on :type
  validates :title, presence: true
  validates :type_list, presence: true, unless: :from_api
  validates :description, presence: true
  validates :help_amount, presence: true
  validates :general_condition, presence: true
  validates :candidate_url, presence: true
  validates :institution_name, presence: true
  validates :institution_url, presence: true
  validates :author_email, presence: true, if: :suggested
  validates :accept_cgu, presence: true, if: :suggested

  PARITE = [
    "respectée",
    "non-respectée"
  ]

  HELP_TITLE = {
    "AIC": "Aide individuelle à la création | AIC",
    "AIA": "Aide à l'installation d'atelier et à l'achat de matériel | AIA",
    "Secours exceptionnel": "Secours exceptionnel"
  }

  HELP_TYPE = ["dotation financière", "résidence", "édition", "exposition & festival", "accompagnement d'expert(e)"]

  HELP_RESIDENCE = [
    "Auvergne-Rhône Alpes",
    "Bourgogne-Franche-Comté",
    "Bretagne",
    "Centre-Val de Loire",
    "Corse",
    "Grand-Est",
    "Guadeloupe",
    "Guyane",
    "Hauts de France",
    "Ile-de-France",
    "Martinique",
    "Mayotte",
    "Normandie",
    "Nouvelle-Aquitaine",
    "Occitanie",
    "Pays de la Loire",
    "Provence-Alpes-Côte-d'Azur",
    "Réunion",
    "Française ou résidant en France",
    "Française résidant en outre-mer",
    "Française résidant à l'étranger"
  ]
end
