class CaseReview < ApplicationRecord
  has_one_attached :case_attachment, service: :scaleway
  has_one_attached :review_comment, service: :scaleway
  validates :case_attachment, content_type: ['application/pdf']
  # validates :points_faibles, presence: true, on: :notation
  # validates :points_forts, presence: true, on: :notation
  validates :case_attachment, presence: true

  validates :candidate_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
