class DeleteColumnsToHelps < ActiveRecord::Migration[6.1]
  def change
    remove_column :helps, :sector
    remove_column :helps, :url_commission
    remove_column :helps, :old_laureat_url
    remove_column :helps, :artistic_attachment
    remove_column :helps, :other_attachment
    remove_column :helps, :contact_institution_url
    remove_column :helps, :contact_intitution_partenaire
    remove_column :helps, :example_enrollment_url
    remove_column :helps, :issue_contact
    remove_column :helps, :statistic
    remove_column :helps, :identifiant
    remove_column :helps, :institution_partenaire
    remove_column :helps, :regularity
    remove_column :helps, :residence_time
    remove_column :helps, :help_advantage
    remove_column :helps, :old_laureats_case_url
    remove_column :helps, :parentality
    remove_column :helps, :accessibility
  end
end
