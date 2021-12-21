class CreateNotationConseilsVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :notation_conseils_videos do |t|
      t.references :conseils_video
      t.integer :utile, default: 0, null: false
      t.integer :inutile, default: 0, null: false
      t.timestamps
    end
  end
end
