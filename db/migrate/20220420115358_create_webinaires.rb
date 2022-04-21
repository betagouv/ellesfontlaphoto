class CreateWebinaires < ActiveRecord::Migration[6.1]
  def change
    create_table :webinaires do |t|
      t.string :title
      t.datetime :date
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
