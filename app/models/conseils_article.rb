class ConseilsArticle < ApplicationRecord

  acts_as_taggable_on :tags, :category
  validates :title, presence: true

  has_one :notation_conseils_article

  CONSEIL_CATEGORIES = {
    "Administratif & Financier": {image: "livre-rouge.png", text: " administratifs et financiers"},
    "Artistique & Technique": {image:"stylo.png", text: " artistiques et techniques"},
    "Egalite & inclusion": {image: "etoile.png", text: " égalité et inclusion"},
  }

  CONSEIL_TAGS = ["Commencer mon activité", "Me former"]
end
