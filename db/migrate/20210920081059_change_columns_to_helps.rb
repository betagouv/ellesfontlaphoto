class ChangeColumnsToHelps < ActiveRecord::Migration[6.1]
  def change
    remove_column :helps, :end_month, :string
    remove_column :helps, :start_month, :string
    add_column :helps, :end_date, :date
    add_column :helps, :start_date, :date
  end
end
