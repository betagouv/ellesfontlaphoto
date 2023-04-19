class ChangeColumnsToOrganizations < ActiveRecord::Migration[6.1]
  def change
    remove_column :organizations, :nb_women_dir, :integer
    remove_column :organizations, :total_nb_dir, :integer
    remove_column :organizations, :nb_women_expos, :integer
    remove_column :organizations, :total_nb_expos, :integer
    remove_column :organizations, :score_parity, :float
    remove_column :organizations, :expos_parity, :float
    remove_column :organizations, :nb_femmes_laureates, :integer
    remove_column :organizations, :nb_total_laureates, :integer
    remove_column :organizations, :laureates_parity, :float
    remove_column :organizations, :nb_femmes_candidates, :integer
    remove_column :organizations, :nb_total_candidats, :integer
    remove_column :organizations, :candidates_parity, :float
    remove_column :organizations, :nb_femmes_publiees, :integer
    remove_column :organizations, :nb_total_publies, :integer
    remove_column :organizations, :publies_parity, :float
    remove_column :organizations, :nb_femmes_iconographes, :integer
    remove_column :organizations, :nb_total_iconographes, :integer
    remove_column :organizations, :iconographes_parity, :float
    remove_column :organizations, :nb_femmes_enseignantes, :integer
    remove_column :organizations, :nb_total_enseignants, :integer
    remove_column :organizations, :enseignants_parity, :float
    remove_column :organizations, :nb_femmes_etudiantes, :integer
    remove_column :organizations, :nb_total_etudiants, :integer
    remove_column :organizations, :etudiants_parity, :float
    remove_column :organizations, :dir_parity, :float
    remove_column :organizations, :request_info_count, :integer

    add_column :organizations, :email, :string
    add_column :organizations, :finance_ministre, :boolean, default: false
    add_column :organizations, :page_structure, :boolean, default: false
    add_column :organizations, :observatoire_egalite, :boolean, default: false

  end
end
