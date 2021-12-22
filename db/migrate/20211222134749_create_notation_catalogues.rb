class CreateNotationCatalogues < ActiveRecord::Migration[6.1]
  def change
    create_table :notation_catalogues do |t|
      t.string  :catalogue
      t.integer :utile, default: 0, null: false
      t.integer :utile_mais_fermee, default: 0, null: false
      t.integer :inutile, default: 0, null: false
      t.timestamps
    end
  end
end
