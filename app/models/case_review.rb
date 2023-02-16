class CaseReview < ApplicationRecord
  has_one_attached :case_attachment, service: :scaleway
  has_one_attached :review_comment, service: :scaleway
  validate :acceptable_dossier, on: :create
  validate :acceptable_dossier_comment, on: :review_case

  validates :points_faibles, presence: true, on: :review_case
  validates :points_forts, presence: true, on: :review_case
  validates :case_attachment, presence: true
  validates :accept_partage_email, inclusion: { in: [true, false] }, on: :review_case

  validates :status, inclusion: { in: ['En attente de binôme', 'En attente de revue', 'Revue', 'Revue non effectuée'] }
  validates :candidate_email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }

  def en_attente_de_binome
    case_review = self
    case_review.update(status: 'En attente de binôme', creation_binome: nil, points_faibles: nil, points_forts: nil, lien_video: nil, autres: nil)
    case_review.review_comment.purge if case_review.review_comment.attached?
  end

  def acceptable_dossier
    return unless case_attachment.attached?
    unless case_attachment.blob.byte_size <= 20.megabyte
      errors.add(:file_size_out_of_range, :file_size_out_of_range)
    end
  end

  def acceptable_dossier_comment
    return unless review_comment.attached?
    unless review_comment.blob.byte_size <= 20.megabyte
      errors.add(:file_size_out_of_range, :file_size_out_of_range)
    end
  end
end
