class AddDescriptionAndPermanentColumnsToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :description_longue, :text
    add_column :helps, :permanent, :boolean, default: false
  end
end
