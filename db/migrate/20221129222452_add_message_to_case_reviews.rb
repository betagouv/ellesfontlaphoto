class AddMessageToCaseReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :case_reviews, :message, :text
  end
end
