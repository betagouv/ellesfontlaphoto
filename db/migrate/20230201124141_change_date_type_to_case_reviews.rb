class ChangeDateTypeToCaseReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :case_reviews, :creation_binome, :datetime
    change_column :case_reviews, :date_envoi_feedback, :datetime
    change_column :case_reviews, :date_notation, :datetime
  end
end
