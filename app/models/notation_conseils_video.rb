class NotationConseilsVideo < ApplicationRecord
  belongs_to :conseils_video
  validates :conseils_video, uniqueness: true
end
