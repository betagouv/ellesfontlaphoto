class AddColumnsToNotationConseilsArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :notation_conseils_articles, :comment, :text
    add_column :notation_conseils_articles, :suggestion, :text
  end
end
