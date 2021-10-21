class UpdateSomeColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :conseils_articles, :category, :string, array: true, default: []
    remove_column :conseils_videos, :category, :string, array: true, default: []
    remove_column :conseils_articles, :liens_utiles, :string, array: true, default: []
    remove_column :conseils_videos, :liens_utiles, :string, array: true, default: []
    add_column :conseils_articles, :liens_utiles, :string
    add_column :conseils_videos, :liens_utiles, :string
  end
end
