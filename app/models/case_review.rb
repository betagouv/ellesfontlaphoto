class CaseReview < ApplicationRecord
  has_one_attached :case, service: :scaleway
  validate :correct_type_acttachment

  def correct_type_attachment
    if self.case.attached? && !self.case.content_type.in?(%w(application/pdf))
      errors.add(:case, "Le dossier doit être au format pdf")
    end
  end
end
