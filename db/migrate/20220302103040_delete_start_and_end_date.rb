class DeleteStartAndEndDate < ActiveRecord::Migration[6.1]
  def change
    remove_column :helps, :start_date, :date
    remove_column :helps, :end_date, :date
  end
end
