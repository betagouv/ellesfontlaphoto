class AddMoreColumnsToHelps < ActiveRecord::Migration[6.1]
  def change
    add_column :helps, :identifiant, :string
    add_column :helps, :institution_partenaire, :string
    add_column :helps, :regularity, :string
    add_column :helps, :description_url, :string
    add_column :helps, :residence_time, :string
    add_column :helps, :help_advantage, :string
    rename_column :helps, :qa_url, :faq_url
    add_column :helps, :old_laureats_case_url, :string
    add_column :helps, :parentality, :string
    add_column :helps, :accessibility, :string
    remove_column :helps, :contact_email, :string
    add_column :helps, :contact_intitution_email, :string, array: true, default: []
    add_column :helps, :contact_intitution_partenaire, :string, array: true, default: []
    rename_column :helps, :structure_name, :institution_name
  end
end
