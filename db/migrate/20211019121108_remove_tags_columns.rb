class RemoveTagsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :conseils_articles, :tags, :string, array: true, default: []
    remove_column :conseils_videos, :tags, :string, array: true, default: []
  end
end
