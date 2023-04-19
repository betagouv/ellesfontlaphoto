class AddVisibleToChiffresOrganization < ActiveRecord::Migration[6.1]
  def change
    add_column :chiffres_organizations, :visible, :boolean, default: false
  end
end
