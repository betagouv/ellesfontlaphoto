class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :organization_type
      t.string :name
      t.string :city
      t.integer :nb_women_dir
      t.integer :total_nb_dir
      t.boolean :dir_parity
      t.integer :nb_women_expos
      t.integer :total_nb_expos
      t.boolean :expos_parity
      t.integer :score_parity
      t.timestamps
    end
  end
end
