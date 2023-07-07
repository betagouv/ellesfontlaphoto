class RemoveColumnsFromWebinaires < ActiveRecord::Migration[6.1]
  def change
    remove_column :webinaires, :show_date
    remove_column :webinaires, :page_rencontre
    remove_column :webinaires, :show_visio
    remove_column :webinaires, :sous_titre
  end
end
