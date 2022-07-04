class AddColumnsToWebinaire < ActiveRecord::Migration[6.1]
  def change
    add_column :webinaires, :show_date, :boolean
    add_column :webinaires, :show_visio, :boolean
  end
end
