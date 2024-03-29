class Organization < ApplicationRecord
  has_many :chiffres_organizations, dependent: :destroy
  validates :organization_type, presence: true
  validates :titre, presence: true, if: -> { organization_type == "Prix" }
  validates :name, presence: true
  accepts_nested_attributes_for :chiffres_organizations, allow_destroy: true
  belongs_to :organization, optional: true

  ORGANIZATION_TYPE = [
    "Espace d'exposition",
    "Festival",
    "École",
    "Prix",
    "Journal/Magazine"
  ]

  def self.chiffres_organizations_unseen
    chiffres_organizations.where(visible: false)
  end

  def self.chiffres_organizations_seen
    chiffres_organizations.where(visible: true)
  end

  def prix?
    organization_type == "Prix"
  end

  def ecole?
    organization_type == "École"
  end

  def orga?
    organization_type == "Espace d'exposition" || organization_type == "Festival"
  end

  def journal?
    organization_type == "Journal/Magazine"
  end

end
