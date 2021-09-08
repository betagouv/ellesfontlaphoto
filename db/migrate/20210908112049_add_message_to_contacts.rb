class AddMessageToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :message, :text
  end
end
