class AddReferenceToOrganization < ActiveRecord::Migration[6.1]
  def change
    add_reference :organizations, :organization, foreign_key: true
  end
end
