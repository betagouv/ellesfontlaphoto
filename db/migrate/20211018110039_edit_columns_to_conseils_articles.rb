class EditColumnsToConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :conseils_articles, :citation_auteur, :string
    remove_column :conseils_articles, :sources, :string, array: true, default: []
    add_column :conseils_articles, :sources, :string
  end
end
