class RemoveColumnsFromConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :conseils_articles, :iframe_url
    remove_column :conseils_articles, :perspective
  end
end
