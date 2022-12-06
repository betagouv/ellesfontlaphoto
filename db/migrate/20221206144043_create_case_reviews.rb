class CreateCaseReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :case_reviews do |t|
      t.string :candidate_email
      t.string :reviewer_email
      t.boolean :engagement
      t.text :message
      t.date :creation_binome
      t.date :date_notation
      t.string :status
      t.text :points_forts
      t.text :points_faibles
      t.string :lien_video
      t.text :autres
      t.timestamps
    end
  end
end
