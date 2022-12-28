class ChangeDefaultValueAcceptPartageEmailInCaseReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :case_reviews, :accept_partage_email, :boolean, default: nil
  end
end
