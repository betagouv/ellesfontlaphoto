ActiveAdmin.register ChiffresOrganization do
  permit_params :annee, :nb_femmes_etudiantes, :nb_total_etudiants, :etudiants_parite, :nb_femmes_enseignantes, :nb_total_enseignants, :enseignants_parite, :nb_femmes_photographes_etudiees, :nb_total_photographes_etudies, :photographes_etudies_parite, :nb_femmes_publiees, :nb_total_publies, :publies_parite, :nb_femmes_iconographes, :nb_total_iconographes, :iconographes_parite, :nb_femmes_exposees, :nb_total_exposes, :exposes_parite, :nb_femmes_exposees_expo_collective, :nb_total_exposes_expo_collective, :exposes_expo_collective_parite, :nb_femmes_exposees_expo_mono, :nb_total_exposes_expo_mono, :exposes_expo_mono_parite, :nb_femmes_moins_40, :nb_femmes_plus_40, :nb_femmes_post_mortem, :nb_femmes_commissaires, :nb_total_commissaires, :commissaires_parite, :nb_femmes_artistes, :nb_total_artistes, :artistes_parite, :nb_oeuvres_photo_femmes, :nb_total_oeuvres_photo, :oeuvres_photo_parite, :nb_femmes_oeuvres_ajoutees, :nb_total_oeuvres_ajoutees, :oeuvres_ajoutees_parite, :nb_femmes_candidates, :nb_total_candidats, :candidates_parite, :nb_femmes_laureates, :nb_total_laureates, :laureates_parite, :nb_femmes_jurys, :nb_total_jurys, :jurys_parite, :nb_femmes_accueil_residence, :nb_total_accueil_residence, :accueil_residence_parite, :nb_femmes_photo_ouvrages, :nb_total_photo_ouvrages, :photo_ouvrages_parite, :nb_femmes_photographes_invites, :nb_total_photographes_invites, :photographes_invites_parite, :nb_femmes_directrices, :nb_total_directeurs, :directeurs_parite, :nb_femmes_employees, :nb_total_employes, :employes_parite, :actions_egalite, :organization_id, :visible, :organization

  belongs_to :organization

  index do
    column :id
    column :visible
    column :annee
    column :organization
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Chiffre pour #{organization.name}" do
      f.input :organization, input_html: { disabled: true }
      f.input :annee, as: :select, collection: (2020...Date.today.year).to_a
      f.input :visible
      if organization.ecole?
        f.input :nb_femmes_etudiantes
        f.input :nb_total_etudiants
        f.input :nb_femmes_enseignantes
        f.input :nb_total_enseignants
        f.input :nb_femmes_photographes_etudiees
        f.input :nb_total_photographes_etudies
      end
      if organization.journal?
        f.input :nb_femmes_publiees
        f.input :nb_total_publies
        f.input :nb_femmes_iconographes
        f.input :nb_total_iconographes
      end
      if organization.orga?
        f.input :nb_femmes_exposees
        f.input :nb_total_exposes
        f.input :nb_femmes_exposees_expo_collective
        f.input :nb_total_exposes_expo_collective
        f.input :nb_femmes_exposees_expo_mono
        f.input :nb_total_exposes_expo_mono
        f.input :nb_femmes_moins_40
        f.input :nb_femmes_plus_40
        f.input :nb_femmes_post_mortem
        f.input :nb_femmes_commissaires
        f.input :nb_total_commissaires
        f.input :nb_femmes_artistes
        f.input :nb_total_artistes
        f.input :nb_oeuvres_photo_femmes
        f.input :nb_total_oeuvres_photo
        f.input :nb_femmes_oeuvres_ajoutees
        f.input :nb_total_oeuvres_ajoutees
      end
      if organization.prix?
        f.input :nb_femmes_candidates
        f.input :nb_total_candidats
        f.input :nb_femmes_laureates
        f.input :nb_total_laureates
        f.input :nb_femmes_jurys
        f.input :nb_total_jurys
      end
      f.input :nb_femmes_accueil_residence
      f.input :nb_total_accueil_residence
      f.input :nb_femmes_photo_ouvrages
      f.input :nb_total_photo_ouvrages
      f.input :nb_femmes_photographes_invites
      f.input :nb_total_photographes_invites
      f.input :nb_femmes_directrices
      f.input :nb_total_directeurs
      f.input :nb_femmes_employees
      f.input :nb_total_employes
      f.input :actions_egalite
    end
    f.actions
  end
end
