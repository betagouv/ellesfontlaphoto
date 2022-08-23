class AddSuggestedInHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :suggested, :boolean, default: false
  end
end
