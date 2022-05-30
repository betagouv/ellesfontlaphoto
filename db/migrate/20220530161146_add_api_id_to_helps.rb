class AddApiIdToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :api_id, :integer
  end
end
