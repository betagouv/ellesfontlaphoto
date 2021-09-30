class Help < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_residence_condition,
    against: [ :residence_condition ],
    using: {
      tsearch: { prefix: true }
    }

  HELP_TITLE = {
    "AIC": "Aide individuelle à la création | AIC",
    "AIA": "Aide à l'installation d'atelier et à l'achat de matériel | AIA",
    "Secours exceptionnel": "Secours exceptionnel"
  }

  HELP_TYPE = {
    "Matériel": "📸 financer du matériel",
    "Production": "🛠 financer une production",
    "Aide Sociale": "🔮 un secours exceptionnel",
    "Résidence": "🏠 une résidence (artistique)",
    "Diffusion": "📣 financer une diffusion"
  }

  HELP_RESIDENCE = [
    "Auvergne-Rhône Alpes",
    "Bourgogne-Franche Comté",
    "Bretagne",
    "Centre Val de Loire",
    "Corse",
    "Grand-Est",
    "Guadeloupe",
    "Guyane",
    "Hauts de France",
    "Ile de France",
    "Martinique",
    "Mayotte",
    "Normandie",
    "Nouvelle Aquitaine",
    "Occitanie",
    "Pays de la Loire",
    "Provence-Alpes-Côte-d'Azur",
    "Réunion",
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
  validates :help_type, inclusion: { in: ["Matériel", "Production", "Aide Sociale", "Diffusion", "Résidence"] }
end
