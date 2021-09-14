class AddColumnsToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :example_enrollment_url, :string
    add_column :helps, :qa_url, :string
    add_column :helps, :issue_contact, :string
  end
end
