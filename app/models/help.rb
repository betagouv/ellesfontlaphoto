class Help < ApplicationRecord
  HELP_TITLE = {
    "AIC": "Aide individuelle à la création | AIC",
    "AIA": "Aide à l'installation d'atelier et à l'achat de matériel | AIC",
  }

  HELP_TYPE = {
    "Matériel": "Achat de matériel",
    "Production": "Aide à la production",
    "Social": "Aide sociale",
    "Autre": "Aide diverses"
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
    "Bourgogne -Franche Comté",
    "Auvergne-Rhône Alpes",
    "Réunion",
    "Mayotte",
    "Martinique",
    "Guyane",
    "Guadeloupe",
    "France"
  ]

  HELP_MONTH = [
    "janvier",
    "février",
    "mars",
    "avril",
    "mai",
    "juin",
    "juillet",
    "août",
    "septembre",
    "octobre",
    "novembre",
    "décembre",
  ]

  HELP_MONTH_TRANSLATE = {
    "janvier": "jan",
    "février": "feb",
    "mars": "mar",
    "avril": "apr",
    "mai": "may",
    "juin": "june",
    "juillet": "jul",
    "août": "aug",
    "septembre": "sept",
    "octobre": "oct",
    "novembre": "nov",
    "décembre": "dec",
  }

  validates :residence_condition, inclusion: { in: Help::HELP_RESIDENCE }
  validates :start_month, inclusion: { in: Help::HELP_MONTH }
  validates :end_month, inclusion: { in: Help::HELP_MONTH }
  validates :title, inclusion: { in: ["AIC", "AIA"] }
  validates :help_type, inclusion: { in: ["Matériel", "Production"] }
end
