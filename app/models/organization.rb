class Organization < ApplicationRecord
  # validates :organization_type, presence: true
  validates :name, presence: true
  has_one_attached :logo

  ORGANIZATION_TYPE = [
    "Structure",
    "Festival"
  ]
end
