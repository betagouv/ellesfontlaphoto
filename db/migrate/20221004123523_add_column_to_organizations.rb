class AddColumnToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :request_info_count, :integer, default: 0
  end
end
