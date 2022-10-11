class NotationConseilsVideo < ApplicationRecord
  belongs_to :conseils_video

  def self.pourcentage_notation_conseils_videos_utile
    (NotationConseilsVideo.where(utile: 1).count * 100).fdiv(NotationConseilsVideo.count)
  end

  def self.pourcentage_notation_conseils_videos_inutile
    (NotationConseilsVideo.where(inutile: 1).count * 100).fdiv(NotationConseilsVideo.count)
  end
end
