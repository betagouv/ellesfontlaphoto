class ConseilsArticle < ApplicationRecord

  acts_as_taggable_on :tags, :category
  validates :title, presence: true

  CONSEIL_CATEGORIES = {
    "Administratif & Financier": "📕 administratifs et financiers",
    "Artistique & Technique": "🖌 artistiques et techniques",
    "Egalite & inclusion": "🌟 égalité et inclusion",
  }

  CONSEIL_TAGS = ["Commencer mon activité", "Me former"]
end
