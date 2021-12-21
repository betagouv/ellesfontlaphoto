class CreateNotationConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :notation_conseils_articles do |t|
      t.references :conseils_article
      t.integer :utile, default: 0, null: false
      t.integer :inutile, default: 0, null: false
      t.timestamps
    end
  end
end
