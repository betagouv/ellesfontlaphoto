class ChangeColumnsInWebinaire < ActiveRecord::Migration[6.1]
  def change
    rename_column :webinaires, :place, :lieu
    rename_column :webinaires, :title, :titre
    rename_column :webinaires, :lieu, :url
    add_column :webinaires, :sous_titre, :string
    add_column :webinaires, :page_rencontre, :boolean
    add_column :webinaires, :participant, :string
  end
end
