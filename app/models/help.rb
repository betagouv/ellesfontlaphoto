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
    "Matériel": {image: "appareil-photo.png", text: " financer du matériel"},
    "Production": {image: "outils.png", text: " financer une production"},
    "Aide Sociale": {image: "boule-de-cristal.png", text: " un secours exceptionnel"},
    "Résidence": {image: "maison.png", text: " une résidence (artistique)"},
    "Diffusion": {image: "haut-parleur.png", text: " financer une diffusion"},
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

  validates :residence_condition, inclusion: { in: Help::HELP_RESIDENCE }
  validates :type_list, inclusion: { in: ["Matériel", "Production", "Aide Sociale", "Diffusion", "Résidence"] }
end
