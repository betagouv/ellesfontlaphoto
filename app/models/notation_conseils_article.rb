class NotationConseilsArticle < ApplicationRecord
  has_one :conseils_article
  validates :conseils_article, uniqueness: true
end
