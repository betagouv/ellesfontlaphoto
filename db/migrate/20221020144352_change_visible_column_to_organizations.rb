class ChangeVisibleColumnToOrganizations < ActiveRecord::Migration[6.1]
  def change
    remove_column :organizations, :visible, :boolean
    add_column :organizations, :visible, :boolean, default: true
  end
end
