class AddPariteToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :commission_parite, :string
    add_column :helps, :old_laureats_parite, :string
  end
end
