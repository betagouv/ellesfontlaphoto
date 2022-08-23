class ChangeGeneralConditionColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :helps, :general_condition, :text
  end
end
