class EditColumnsToConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :conseils_articles, :citation_auteur, :string
    remove_column :conseils_articles, :a_retenir, :string
    add_column :conseils_articles, :a_retenir, :string, array: true, default: []
  end
end
