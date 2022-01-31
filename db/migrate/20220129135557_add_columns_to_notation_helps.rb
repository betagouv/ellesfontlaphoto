class AddColumnsToNotationHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :notation_helps, :comment, :text
    add_column :notation_helps, :suggestion, :text
  end
end
