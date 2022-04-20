class Webinaire < ApplicationRecord
  acts_as_taggable_on :tags, :category
end
