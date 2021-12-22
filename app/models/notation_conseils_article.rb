class NotationConseilsArticle < ApplicationRecord
  belongs_to :conseils_article
  validates :conseils_article, uniqueness: true
end
