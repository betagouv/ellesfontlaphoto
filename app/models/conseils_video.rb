class ConseilsVideo < ApplicationRecord
  has_one_attached :image
  has_one_attached :video
  validate :correct_type_attachment

  validates :video, presence: true

  has_one_attached :video
  acts_as_taggable_on :tags, :category

  CONSEIL_CATEGORIES = {
    "Administratif & Financier": {image: "livre-rouge.png", text: " administratifs et financiers"},
    "Artistique & Technique": {image:"stylo.png", text: " artistiques et techniques"},
    "Egalite & inclusion": {image: "etoile.png", text: " égalité et inclusion"},
  }

  CONSEIL_TAGS = ["Commencer mon activité", "Me former"]

  VIDEO_FORMAT = {
    "Verbatim": "un jour on m'a dit que...",
    "Thématique": "Déclic",
    "Témoignage": "La première fois que ..."
  }

  def correct_type_attachment
    if image.attached? && !image.content_type.in?(%w(image/jpg image/jpeg image/png))
      errors.add(:image, "L'image doit être au format png ou jpeg/jpg")
    end
    if video.attached? && !video.content_type.in?(%w(video/mp4))
      errors.add(:video, "La vidéo doit être au format mp4 et ne doit pas depasser 100MB ")
    end
  end

end
