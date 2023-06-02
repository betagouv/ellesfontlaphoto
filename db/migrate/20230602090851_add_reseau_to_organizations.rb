class AddReseauToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :reseau, :string
  end
end
