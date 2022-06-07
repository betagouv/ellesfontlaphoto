class Webinaire < ApplicationRecord
  acts_as_taggable_on :tags, :category
  has_many_attached :images
end
