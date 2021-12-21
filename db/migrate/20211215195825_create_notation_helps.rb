class CreateNotationHelps < ActiveRecord::Migration[6.1]
  def change
    create_table :notation_helps do |t|
      t.references :help
      t.integer :oui, default: 0, null: false
      t.integer :oui_mais_fermee, default: 0, null: false
      t.integer :non, default: 0, null: false
      t.timestamps
    end
  end
end
