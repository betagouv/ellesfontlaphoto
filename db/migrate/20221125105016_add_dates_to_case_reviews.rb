class AddDatesToCaseReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :case_reviews, :creation_binome, :date
    add_column :case_reviews, :date_notation, :date
  end
end
