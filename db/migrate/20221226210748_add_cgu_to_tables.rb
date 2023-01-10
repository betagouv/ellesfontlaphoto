class AddCguToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :accept_cgu, :boolean, default: false
    add_column :notification_helps, :accept_cgu, :boolean, default: false
  end
end
