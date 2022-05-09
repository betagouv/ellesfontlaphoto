class AddInscriptionUrlInWebinaires < ActiveRecord::Migration[6.1]
  def change
    add_column :webinaires, :url_inscription, :string
  end
end
