class ConseilsArticle < ApplicationRecord

  acts_as_taggable_on :tags, :category
  validates :title, presence: true

  CONSEIL_CATEGORIES = {
    "Administratif & Financier": "📕 administratifs et financiers",
    "Artistique & Technique": "🖌 artistiques et techniques",
    "Rôle modèles": "🌟 rôle modèles",
  }

  CONSEIL_TAGS = ["Commencer mon activité", "Me former", "Gérer ma carrière", "Sensibiliser pour l'égalité"]
end
