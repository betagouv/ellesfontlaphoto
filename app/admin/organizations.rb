ActiveAdmin.register Organization do
  permit_params :visible, :organization_type, :organization, :name, :city, :titre, :finance_ministre, :page_structure, :observatoire_egalite, chiffres_organizations_attributes: [:id, :annee, :visible, :nb_femmes_etudiantes, :nb_total_etudiants, :nb_femmes_enseignantes, :nb_total_enseignants, :nb_femmes_photographes_etudiees, :nb_total_photographes_etudies, :nb_femmes_publiees, :nb_total_publies, :nb_femmes_iconographes, :nb_total_iconographes, :nb_femmes_exposees, :nb_total_exposes, :nb_femmes_exposees_expo_collective, :nb_total_exposes_expo_collective, :nb_femmes_exposees_expo_mono, :nb_total_exposes_expo_mono, :nb_femmes_moins_40, :nb_femmes_plus_40, :nb_femmes_post_mortem, :nb_femmes_commissaires, :nb_total_commissaires,  :nb_femmes_artistes, :nb_total_artistes, :nb_oeuvres_photo_femmes, :nb_total_oeuvres_photo, :nb_femmes_oeuvres_ajoutees, :nb_total_oeuvres_ajoutees, :nb_femmes_candidates, :nb_total_candidats, :nb_femmes_laureates, :nb_total_laureates, :nb_femmes_jurys, :nb_total_jurys, :nb_femmes_accueil_residence, :nb_total_accueil_residence, :nb_femmes_photo_ouvrages, :nb_total_photo_ouvrages, :nb_femmes_photographes_invites, :nb_total_photographes_invites, :nb_femmes_directrices, :nb_total_directeurs, :nb_femmes_employees, :nb_total_employes, :actions_egalite, :_destroy]

  after_create do |organization|
    organization.organization_type = params["organization"]["organization_type"]
    organization.save
  end

  after_update do |organization|
    organization.organization_type = params["organization"]["organization_type"]
    organization.save
  end

  index do
    column :visible
    column :id
    column :organization_type
    column :name
    column :city
    column :organization
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Organisation" do
      f.input :finance_ministre, default: false
      f.input :page_structure, default: false
      f.input :observatoire_egalite, default: false
      f.input :visible
      f.input :organization_type, as: :radio, collection: Organization::ORGANIZATION_TYPE, label: "Type"
      f.input :name, label: "Nom"
      f.input :city, label: "Ville"
      f.input :organization, label: "Organization porteuse du prix", hint: "Remplir ce champ seulement si l'organization est un prix et qu"
      unless f.object.new_record?
        f.has_many :chiffres_organizations, heading: "Chiffres", new_record: "Renseigner les chiffres pour une nouvelle annee", allow_destroy: true do |a|
          a.input :annee, as: :select, collection: (2020...Date.today.year).to_a
          a.input :visible
          if organization.ecole?
            a.input :nb_femmes_etudiantes
            a.input :nb_total_etudiants
            a.input :nb_femmes_enseignantes
            a.input :nb_total_enseignants
            a.input :nb_femmes_photographes_etudiees
            a.input :nb_total_photographes_etudies
          end
          if organization.journal?
            a.input :nb_femmes_publiees
            a.input :nb_total_publies
            a.input :nb_femmes_iconographes
            a.input :nb_total_iconographes
          end
          if organization.orga?
            a.input :nb_femmes_exposees
            a.input :nb_total_exposes
            a.input :nb_femmes_exposees_expo_collective
            a.input :nb_total_exposes_expo_collective
            a.input :nb_femmes_exposees_expo_mono
            a.input :nb_total_exposes_expo_mono
            a.input :nb_femmes_moins_40
            a.input :nb_femmes_plus_40
            a.input :nb_femmes_post_mortem
            a.input :nb_femmes_commissaires
            a.input :nb_total_commissaires
            a.input :nb_femmes_artistes
            a.input :nb_total_artistes
            a.input :nb_oeuvres_photo_femmes
            a.input :nb_total_oeuvres_photo
            a.input :nb_femmes_oeuvres_ajoutees
            a.input :nb_total_oeuvres_ajoutees
          end
          if organization.prix?
            a.input :nb_femmes_candidates
            a.input :nb_total_candidats
            a.input :nb_femmes_laureates
            a.input :nb_total_laureates
            a.input :nb_femmes_jurys
            a.input :nb_total_jurys
          end
          a.input :nb_femmes_accueil_residence
          a.input :nb_total_accueil_residence
          a.input :nb_femmes_photo_ouvrages
          a.input :nb_total_photo_ouvrages
          a.input :nb_femmes_photographes_invites
          a.input :nb_total_photographes_invites
          a.input :nb_femmes_directrices
          a.input :nb_total_directeurs
          a.input :nb_femmes_employees
          a.input :nb_total_employes
          a.input :actions_egalite
        end
      end
      if f.object.new_record?
        f.has_many :chiffres_organizations, heading: "Chiffres", new_record: "Renseigner les chiffres pour une nouvelle annee", allow_destroy: true do |a|
          a.input :annee, as: :select, :collection => (2020...Date.today.year).to_a
          a.input :nb_femmes_etudiantes
          a.input :nb_total_etudiants
          a.input :nb_femmes_enseignantes
          a.input :nb_total_enseignants
          a.input :nb_femmes_photographes_etudiees
          a.input :nb_total_photographes_etudies
          a.input :nb_femmes_publiees
          a.input :nb_total_publies
          a.input :nb_femmes_iconographes
          a.input :nb_total_iconographes
          a.input :nb_femmes_exposees
          a.input :nb_total_exposes
          a.input :nb_femmes_exposees_expo_collective
          a.input :nb_total_exposes_expo_collective
          a.input :nb_femmes_exposees_expo_mono
          a.input :nb_total_exposes_expo_mono
          a.input :nb_femmes_moins_40
          a.input :nb_femmes_plus_40
          a.input :nb_femmes_post_mortem
          a.input :nb_femmes_commissaires
          a.input :nb_total_commissaires
          a.input :nb_femmes_artistes
          a.input :nb_total_artistes
          a.input :nb_oeuvres_photo_femmes
          a.input :nb_total_oeuvres_photo
          a.input :nb_femmes_oeuvres_ajoutees
          a.input :nb_total_oeuvres_ajoutees
          a.input :nb_femmes_candidates
          a.input :nb_total_candidats
          a.input :nb_femmes_laureates
          a.input :nb_total_laureates
          a.input :nb_femmes_jurys
          a.input :nb_total_jurys
          a.input :nb_femmes_accueil_residence
          a.input :nb_total_accueil_residence
          a.input :nb_femmes_photo_ouvrages
          a.input :nb_total_photo_ouvrages
          a.input :nb_femmes_photographes_invites
          a.input :nb_total_photographes_invites
          a.input :nb_femmes_directrices
          a.input :nb_total_directeurs
          a.input :nb_femmes_employees
          a.input :nb_total_employes
          a.input :actions_egalite
        end
      end
    end
    f.actions
  end
end
