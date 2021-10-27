class Help < ApplicationRecord

  acts_as_taggable_on :type
  validates :title, presence: true
  validates :identifiant, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :residence_condition, presence: true
  validates :description, presence: true

  PARITE = [
    "respectée",
    "non-respectée"
  ]

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
    "Française résidant en outre-mer"
  ]

  HELP_RESIDENCE_TO_SHOW = [
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
    "Française résidant en outre-mer"
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
  validates :type_list, inclusion: { in: ["Matériel", "Production", "Aide Sociale", "Diffusion", "Résidence"] }
end
