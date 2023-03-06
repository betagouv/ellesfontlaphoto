class Organization < ApplicationRecord
  has_many :chiffres_organizations, dependent: :destroy
  validates :organization_type, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  accepts_nested_attributes_for :chiffres_organizations, allow_destroy: true

  ORGANIZATION_TYPE = [
    "Espace d'exposition",
    "Festival",
    "École",
    "Prix",
    "Journal/Magazine"
  ]

end
