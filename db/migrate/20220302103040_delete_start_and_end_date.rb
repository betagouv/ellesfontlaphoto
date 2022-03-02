class DeleteStartAndEndDate < ActiveRecord::Migration[6.1]
  def change
    remove_column :helps, :start_date
    remove_column :helps, :end_date
  end
end
