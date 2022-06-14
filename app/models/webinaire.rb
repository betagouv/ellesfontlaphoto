class Webinaire < ApplicationRecord
  acts_as_taggable_on :tags, :category, :type
  has_many_attached :images

    TYPE_RENCONTRE = [
    "webinaire",
    "outil d'entraide",
    "atelier",
  ]
end
