class ChangeColumnsToConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :conseils_articles, :a_retenir, :string, array: true, default: []
    add_column :conseils_articles, :a_retenir, :string
    remove_column :conseils_articles, :sources, :string, array: true, default: []
    add_column :conseils_articles, :sources, :string
  end
end
