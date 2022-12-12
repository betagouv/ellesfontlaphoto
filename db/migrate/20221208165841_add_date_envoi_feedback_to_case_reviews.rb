class AddDateEnvoiFeedbackToCaseReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :case_reviews, :date_envoi_feedback, :date
  end
end
