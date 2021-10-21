class ConseilsVideo < ApplicationRecord

  acts_as_taggable_on :tags, :category

  CONSEIL_CATEGORIES = {
    "Administratif": "📕 administratif",
    "Financier": "🤑 financiers",
    "Rôle modèles": "🌟 rôle modèles",
    "Technique": "🛠 technique",
    "Matrimoine":  "👑 matrimoine"
  }

  CONSEIL_TAGS = ["Commencer mon activité", "Me former", "Gérer ma carrière", "Sensibiliser pour l'égalité"]

  VIDEO_FORMAT = {
    "Verbatim": "un jour on m'a dit que...",
    "Thématique": "Déclic",
    "Témoignage": "La première fois que ..."
  }

end
