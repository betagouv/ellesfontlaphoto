class CreateCaseReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :case_reviews do |t|
      t.string :candidate_email
      t.string :reviewer_email
      t.timestamps
    end
  end
end
