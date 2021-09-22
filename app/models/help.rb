class Help < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_residence_condition,
    against: [ :residence_condition ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  HELP_TITLE = {
    "AIC": "Aide individuelle à la création | AIC",
    "AIA": "Aide à l'installation d'atelier et à l'achat de matériel | AIA",
    "Secours exceptionnel": "Secours exceptionnel"
  }

  HELP_TYPE = {
    "Matériel": "Achat de matériel",
    "Production": "Aide à la production",
    "Aide Sociale": "Aide sociale",
    "Diffusion": "Aide à la diffusion"
  }

  HELP_RESIDENCE = [
    "Provence-Alpes-Côte-d'Azur",
    "Pays de la Loire",
    "Occitanie",
    "Nouvelle Aquitaine",
    "Normandie",
    "Ile de France",
    "Hauts de France",
    "Grand-Est",
    "Corse",
    "Centre Val de Loire",
    "Bretagne",
    "Bourgogne-Franche Comté",
    "Auvergne-Rhône Alpes",
    "Réunion",
    "Mayotte",
    "Martinique",
    "Guyane",
    "Guadeloupe",
    "Française ou résidant en France"
  ]

  # HELP_MONTH = [
  #   "janvier",
  #   "février",
  #   "mars",
  #   "avril",
  #   "mai",
  #   "juin",
  #   "juillet",
  #   "août",
  #   "septembre",
  #   "octobre",
  #   "novembre",
  #   "décembre",
  # ]

  # HELP_MONTH_TRANSLATE = {
  #   "janvier": "jan",
  #   "février": "feb",
  #   "mars": "mar",
  #   "avril": "apr",
  #   "mai": "may",
  #   "juin": "june",
  #   "juillet": "jul",
  #   "août": "aug",
  #   "septembre": "sept",
  #   "octobre": "oct",
  #   "novembre": "nov",
  #   "décembre": "dec",
  # }

  validates :residence_condition, inclusion: { in: Help::HELP_RESIDENCE }
  # validates :start_month, inclusion: { in: Help::HELP_MONTH }
  # validates :end_month, inclusion: { in: Help::HELP_MONTH }
  # validates :title, inclusion: { in: ["AIC", "AIA", "Secours exceptionnel"] }
  validates :help_type, inclusion: { in: ["Matériel", "Production", "Aide Sociale", "Diffusion"] }
end
