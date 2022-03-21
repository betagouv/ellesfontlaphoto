class AddOpenToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :open, :boolean
  end
end
