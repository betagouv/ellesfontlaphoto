class AddVisibleToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :visible, :boolean
  end
end
