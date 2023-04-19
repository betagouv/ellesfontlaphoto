class CreateChiffresOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :chiffres_organizations do |t|
      t.integer "annee"

      #Ecole
      t.integer "nb_femmes_etudiantes"
      t.integer "nb_total_etudiants"
      t.float "etudiants_parite"
      t.integer "nb_femmes_enseignantes"
      t.integer "nb_total_enseignants"
      t.float "enseignants_parite"
      t.integer "nb_femmes_photographes_etudiees"
      t.integer "nb_total_photographes_etudies"
      t.float "photographes_etudies_parite"

      #Journal/Magazine
      t.integer "nb_femmes_publiees"
      t.integer "nb_total_publies"
      t.float "publies_parite"
      t.integer "nb_femmes_iconographes"
      t.integer "nb_total_iconographes"
      t.float "iconographes_parite"

      #Expositions
      t.integer "nb_femmes_exposees"
      t.integer "nb_total_exposes"
      t.float "exposes_parite"
      t.integer "nb_femmes_exposees_expo_collective"
      t.integer "nb_total_exposes_expo_collective"
      t.float "exposes_expo_collective_parite"
      t.integer "nb_femmes_exposees_expo_mono"
      t.integer "nb_total_exposes_expo_mono"
      t.float "exposes_expo_mono_parite"
      t.integer "nb_femmes_moins_40"
      t.integer "nb_femmes_plus_40"
      t.integer "nb_femmes_post_mortem"
      t.integer "nb_femmes_commissaires"
      t.integer "nb_total_commissaires"
      t.float "commissaires_parite"

      # Fonds photographique et collections permanentes
      t.integer "nb_femmes_artistes"
      t.integer "nb_total_artistes"
      t.float "artistes_parite"
      t.integer "nb_oeuvres_photo_femmes"
      t.integer "nb_total_oeuvres_photo"
      t.float "oeuvres_photo_parite"
      t.integer "nb_femmes_oeuvres_ajoutees"
      t.integer "nb_total_oeuvres_ajoutees"
      t.float "oeuvres_ajoutees_parite"

      # Prix et récompenses
      t.integer "nb_femmes_candidates"
      t.integer "nb_total_candidats"
      t.float "candidates_parite"
      t.integer "nb_femmes_laureates"
      t.integer "nb_total_laureates"
      t.float "laureates_parite"
      t.integer "nb_femmes_jurys"
      t.integer "nb_total_jurys"
      t.float "jurys_parite"

      # Autres activités, hors expositions
      t.integer "nb_femmes_accueil_residence"
      t.integer "nb_total_accueil_residence"
      t.float "accueil_residence_parite"
      t.integer "nb_femmes_photo_ouvrages"
      t.integer "nb_total_photo_ouvrages"
      t.float "photo_ouvrages_parite"
      t.integer "nb_femmes_photographes_invites"
      t.integer "nb_total_photographes_invites"
      t.float "photographes_invites_parite"

      # Effectifs de l’organisation
      t.integer "nb_femmes_directrices"
      t.integer "nb_total_directeurs"
      t.float "directeurs_parite"
      t.integer "nb_femmes_employees"
      t.integer "nb_total_employes"
      t.float "employes_parite"

      t.text "actions_egalite"
      t.references "organization"

      t.timestamps
    end
  end
end
