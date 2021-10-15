class CreateConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :conseils_articles do |t|
      t.string :title
      t.string :subtitle
      t.string :category, array: true, default: []
      t.string :tags, array: true, default: []
      t.string :objectif
      t.integer :lecture_time
      t.text :introduction
      t.text :explication
      t.text :perspective
      t.text :citation
      t.text :a_retenir
      t.text :liens_utiles, array: true, default: []
      t.string :auteur
      t.string :sources, array: true, default: []
      t.timestamps
    end
  end
end
