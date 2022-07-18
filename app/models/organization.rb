class Organization < ApplicationRecord
  validates :organization_type, presence: true
  validates :name, presence: true
  validates :city, presence: true

  ORGANIZATION_TYPE = [
    "Structure",
    "Festival"
  ]
end
