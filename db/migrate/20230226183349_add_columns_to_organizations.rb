class AddColumnsToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :nb_femmes_laureates, :integer
    add_column :organizations, :nb_total_laureates, :integer
    add_column :organizations, :laureates_parity, :float
    add_column :organizations, :nb_femmes_candidates, :integer
    add_column :organizations, :nb_total_candidats, :integer
    add_column :organizations, :candidates_parity, :float
    add_column :organizations, :nb_femmes_publiees, :integer
    add_column :organizations, :nb_total_publies, :integer
    add_column :organizations, :publies_parity, :float
    add_column :organizations, :nb_femmes_iconographes, :integer
    add_column :organizations, :nb_total_iconographes, :integer
    add_column :organizations, :iconographes_parity, :float
    add_column :organizations, :nb_femmes_enseignantes, :integer
    add_column :organizations, :nb_total_enseignants, :integer
    add_column :organizations, :enseignants_parity, :float
    add_column :organizations, :nb_femmes_etudiantes, :integer
    add_column :organizations, :nb_total_etudiants, :integer
    add_column :organizations, :etudiants_parity, :float
    remove_column :organizations, :dir_parity, :boolean
    add_column :organizations, :dir_parity, :float
    add_column :organizations, :titre, :string
  end
end
