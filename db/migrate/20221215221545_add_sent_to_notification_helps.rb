class AddSentToNotificationHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :notification_helps, :sent, :boolean, default: false
  end
end
