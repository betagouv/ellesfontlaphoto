class ChiffresOrganization < ActiveRecord::Base
  belongs_to :organization
  validates :annee, uniqueness: { scope: :organization }
end
