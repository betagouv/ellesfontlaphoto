class AddWebsiteToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :website, :string
  end
end
