ActiveAdmin.register Organization do
  permit_params :visible, :organization_type, :organization, :name, :city, :titre, :finance_ministre, :page_structure, :observatoire_egalite, chiffres_organizations_attributes: [:id, :annee, :visible, :nb_femmes_etudiantes, :nb_total_etudiants, :nb_femmes_enseignantes, :nb_total_enseignants, :nb_femmes_photographes_etudiees, :nb_total_photographes_etudies, :nb_femmes_publiees, :nb_total_publies, :nb_femmes_iconographes, :nb_total_iconographes, :nb_femmes_exposees, :nb_total_exposes, :nb_femmes_exposees_expo_collective, :nb_total_exposes_expo_collective, :nb_femmes_exposees_expo_mono, :nb_total_exposes_expo_mono, :nb_femmes_moins_40, :nb_femmes_plus_40, :nb_femmes_post_mortem, :nb_femmes_commissaires, :nb_total_commissaires,  :nb_femmes_artistes, :nb_total_artistes, :nb_oeuvres_photo_femmes, :nb_total_oeuvres_photo, :nb_femmes_oeuvres_ajoutees, :nb_total_oeuvres_ajoutees, :nb_femmes_candidates, :nb_total_candidats, :nb_femmes_laureates, :nb_total_laureates, :nb_femmes_jurys, :nb_total_jurys, :nb_femmes_accueil_residence, :nb_total_accueil_residence, :nb_femmes_photo_ouvrages, :nb_total_photo_ouvrages, :nb_femmes_photographes_invites, :nb_total_photographes_invites, :nb_femmes_directrices, :nb_total_directeurs, :nb_femmes_employees, :nb_total_employes, :actions_egalite, :_destroy]
  menu label: "Organisation"

  after_create do |organization|
    organization.organization_type = params["organization"]["organization_type"]
    organization.save
  end

  after_update do |organization|
    organization.organization_type = params["organization"]["organization_type"]
    organization.save
  end

  action_item :new, only: :show do
    link_to 'Ajouter des chiffres', new_admin_organization_chiffres_organization_path(resource)
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
      f.input :organization, label: "Organization porteuse du prix", hint: "Remplir ce champ seulement si l'organization est un prix et qu'il depend d'une organisation"
    end
    f.actions
  end

  show do
    attributes_table do
      row :finance_ministre, default: false
      row :page_structure, default: false
      row :observatoire_egalite, default: false
      row :visible
      row :organization_type, as: :radio, collection: Organization::ORGANIZATION_TYPE, label: "Type"
      row :name, label: "Nom"
      row :city, label: "Ville"
      row :organization, label: "Organization porteuse du prix", hint: "Remplir ce champ seulement si l'organization est un prix et qu'il depend d'une organisation"
      row :chiffres_organizations do |obj|
        obj.chiffres_organizations.map { |chiffre| link_to(chiffre.annee, admin_organization_chiffres_organization_path(chiffre)) }.compact
      end
    end
  end
end
