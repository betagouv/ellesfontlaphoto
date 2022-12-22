class CaseReview < ApplicationRecord
  has_one_attached :case_attachment, service: :scaleway
  has_one_attached :review_comment, service: :scaleway
  validates :points_faibles, presence: true, on: :review_case
  validates :points_forts, presence: true, on: :review_case
  validates :accept_partage_email, presence: true, on: :review_case
  validates :case_attachment, presence: true
  validates :accept_partage_email, inclusion: { in: [ true, false ] }


  validates :candidate_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
