class AddEngagementToCaseReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :case_reviews, :engagement, :boolean, default: false
  end
end
