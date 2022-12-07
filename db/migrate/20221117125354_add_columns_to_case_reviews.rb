class AddColumnsToCaseReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :case_reviews, :status, :string
    add_column :case_reviews, :points_forts, :text
    add_column :case_reviews, :points_faibles, :text
    add_column :case_reviews, :lien_video, :string
    add_column :case_reviews, :autres, :text
  end
end
