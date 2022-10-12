class AddFromApiToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :from_api, :boolean, default: false
  end
end
