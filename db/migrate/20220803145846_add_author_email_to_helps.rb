class AddAuthorEmailToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :author_email, :string
  end
end
