class ChangeExpoParityTypeToOrganization < ActiveRecord::Migration[6.1]
  def change
    remove_column :organizations, :expos_parity, :boolean
    add_column :organizations, :expos_parity, :float
  end
end
