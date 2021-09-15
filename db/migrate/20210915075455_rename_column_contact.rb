class RenameColumnContact < ActiveRecord::Migration[6.1]
  def change
    rename_column :contacts, :email, :contact_email
  end
end
