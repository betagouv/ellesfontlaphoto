class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :type
      t.text :comment

      t.timestamps
    end
  end
end
