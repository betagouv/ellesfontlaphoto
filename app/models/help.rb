class Help < ApplicationRecord

  has_one :notation_help
  has_many :candidature_dates, dependent: :destroy
  has_many :notification_helps
  has_many :reviews
  has_many :evaluation_helps
  accepts_nested_attributes_for :candidature_dates, allow_destroy: true

  acts_as_taggable_on :type, :type_photo
  validates :title, presence: true
  validates :description, presence: true
  validates :help_amount, presence: true
  validates :candidate_url, presence: true
  validates :type_list, presence: true, unless: :from_api
  validates :author_email, presence: true, if: :suggested

  PARITE = [
    "respectée",
    "non-respectée"
  ]

  HELP_TITLE = {
    "AIC": "Aide individuelle à la création | AIC",
    "AIA": "Aide à l'installation d'atelier et à l'achat de matériel | AIA",
    "Secours exceptionnel": "Secours exceptionnel"
  }

  HELP_TYPE = ["dotation financière", "résidence", "édition", "exposition & festival", "accompagnement d'expert(e)", "Résidence"]

  PHOTO_TYPE = ["photojournalisme", "photo artistique", "autre"]

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

  # validates :residence_condition, inclusion: { in: Help::HELP_RESIDENCE << "" }
  # validates :type_list, inclusion: { in: HELP_TYPE }
  # validates :type_photo_list, inclusion: { in: PHOTO_TYPE }

end
