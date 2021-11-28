class AddVisibleToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :visible, :boolean, default: true
  end
end
