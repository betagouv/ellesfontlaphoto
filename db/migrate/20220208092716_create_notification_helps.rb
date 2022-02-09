class CreateNotificationHelps < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_helps do |t|
      t.string :email
      t.references :help
      t.timestamps
    end
  end
end
