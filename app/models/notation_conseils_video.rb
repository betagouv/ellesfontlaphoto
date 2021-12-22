class NotationConseilsVideo < ApplicationRecord
  has_one :conseils_video
  validates :conseils_video, uniqueness: true
end
