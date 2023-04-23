ActiveAdmin.register ChiffresOrganization do
  belongs_to :organization

  index do
    column :id
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
