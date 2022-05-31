class CreateHelpApis < ActiveRecord::Migration[6.1]
  def change
    create_table :help_apis do |t|
      t.integer :api_id

      t.timestamps
    end
  end
end
