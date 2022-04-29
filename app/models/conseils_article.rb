class ConseilsArticle < ApplicationRecord

  acts_as_taggable_on :tags, :category
  validates :title, presence: true

  has_one :notation_conseils_article

  CONSEIL_CATEGORIES = [
    "promotion et commercial",
    "administratifs et financiers",
    "artistiques et techniques",
    "égalité et inclusion",
  ]

  CONSEIL_TAGS = ["Commencer mon activité", "Me former"]
end
