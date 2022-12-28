class CaseReview < ApplicationRecord
  has_one_attached :case_attachment, service: :scaleway
  has_one_attached :review_comment, service: :scaleway
  validates :points_faibles, presence: true, on: :review_case
  validates :points_forts, presence: true, on: :review_case
  # validates :accept_partage_email, presence: true, on: :review_case
  validates :case_attachment, presence: true
  validates :accept_partage_email, inclusion: { in: [true, false] }, on: :review_case

  validates :candidate_email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }
end
