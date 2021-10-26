class ConseilsVideo < ApplicationRecord
  has_one_attached :image
  has_one_attached :video
  validate :correct_type_attachment

  validates :image, presence: true
  validates :video, presence: true

  has_one_attached :video
  acts_as_taggable_on :tags, :category

  CONSEIL_CATEGORIES = {
    "Administratif & Financier": "📕 administratifs et financiers",
    "Artistique & Technique": "🖌 artistiques et techniques",
    "Rôle modèles": "🌟 rôle modèles",
  }

  CONSEIL_TAGS = ["Commencer mon activité", "Me former", "Gérer ma carrière", "Sensibiliser pour l'égalité"]

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
      errors.add(:image, "La vidéo doit être au format mp4")
    end
  end

end
