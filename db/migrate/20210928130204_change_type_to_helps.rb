class ChangeTypeToHelps < ActiveRecord::Migration[6.1]
  def change
    remove_column :helps, :help_type, :string
    add_column :helps, :help_type, :string, array: true, default: []
  end
end
