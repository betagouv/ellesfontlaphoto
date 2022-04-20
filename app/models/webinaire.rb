class Webinaire < ApplicationRecord
  acts_as_taggable_on :tags, :category
  has_one_attached :image
end
