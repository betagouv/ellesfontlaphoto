class ChangeColumnsCaseReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :case_reviews, :engagement, :valid_cgu
    add_column :case_reviews, :valid_conditions, :boolean, default: false
  end
end
