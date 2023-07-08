class ConseilsArticle < ApplicationRecord

  acts_as_taggable_on :category
  validates :title, presence: true
  validates :lecture_time, presence: true
  validates :objectif, presence: true

  has_one :notation_conseils_article

  CONSEIL_CATEGORIES = [
    "promotion et commercial",
    "administratifs et financiers",
    "artistiques et techniques",
    "égalité et inclusion",
  ]
end
