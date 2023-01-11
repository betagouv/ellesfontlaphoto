class AddAcceptCguToHelp < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :accept_cgu, :boolean, default: false
  end
end
