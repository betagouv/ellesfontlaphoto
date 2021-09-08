class RenameColumnContacts < ActiveRecord::Migration[6.1]
  def change
    rename_column :contacts, :type, :contact_type
  end
end
