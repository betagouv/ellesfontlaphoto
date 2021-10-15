class CreateConseilsVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :conseils_videos do |t|
      t.string :title
      t.string :subtitle
      t.string :category, array: true, default: []
      t.string :tags, array: true, default: []
      t.string :format #[Verbatim (un jour on m'a dit que...), Thematique (Déclic), Témoignage (La premiere fois que ...)]
      t.string :objectif
      t.integer :lecture_time
      t.text :contenu_explication
      t.text :liens_utiles, array: true, default: []
      t.string :protagoniste
      t.timestamps
    end
  end
end
