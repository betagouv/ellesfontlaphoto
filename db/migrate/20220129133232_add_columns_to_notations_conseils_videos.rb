class AddColumnsToNotationsConseilsVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :notation_conseils_videos, :comment, :text
    add_column :notation_conseils_videos, :suggestion, :text
  end
end
