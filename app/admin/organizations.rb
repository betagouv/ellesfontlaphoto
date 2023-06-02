ActiveAdmin.register Organization do
  permit_params :visible, :organization_type, :organization, :name, :city, :titre, :finance_ministre, :page_structure, :observatoire_egalite, :email, :website, :reseau
  menu label: "Organisation"

  after_create do |organization|
    organization.organization_type = params["organization"]["organization_type"]
    organization.save
  end

  before_update do |organization|
    organization.organization_type = params["organization"]["organization_type"]
    if organization.visible_changed? && organization.visible
      Organization.where(organization: organization).each do |orga|
        orga.update(visible: true)
      end
      organization.chiffres_organizations.each {|chiffre| chiffre.update(visible: true)}
      if organization.chiffres_organizations.count > 1 || organization.chiffres_organizations.first.attributes.except("id", "nb_femmes_directrices", "nb_total_directeurs", "nb_femmes_enseignantes", "nb_total_enseignants", "nb_femmes_etudiantes","nb_total_etudiants", "nb_femmes_laureates", "nb_total_laureates", "nb_femmes_candidates", "nb_total_candidats", "nb_femmes_publiees", "annee", "created_at", "visible", "updated_at", "organization_id", "directeurs_parite", "enseignants_parite", "etudiants_parite", "laureates_parite", "iconographes_parite", "candidates_parite", "publies_parite").values.select { |n| [0.0, nil, ""].exclude?(n) }.count > 0
        organization.update(page_structure: true)
      end
    end
    organization.save
  end

  action_item :new, only: :show do
    link_to 'Ajouter des chiffres', new_admin_organization_chiffres_organization_path(organization)
  end

  index do
    column :visible
    column :id
    column :organization_type
    column :name
    column :city
    column :organization
    column :chiffres_organizations_visible do |obj|
      obj.chiffres_organizations.where(visible: true).map { |chiffre| link_to(chiffre.annee, admin_organization_chiffres_organization_path(obj, chiffre)) }.compact
    end
    column :chiffres_organizations_non_visible do |obj|
      obj.chiffres_organizations.where(visible: false).map { |chiffre| link_to(chiffre.annee, admin_organization_chiffres_organization_path(obj, chiffre)) }.compact
    end
    column :chiffres_organizations_unseen, sortable: 'organization.chiffres_organizations.where(visible: false).count' do |obj|
      obj.chiffres_organizations.where(visible: false).count
    end
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Organisation" do
      f.input :finance_ministre, default: false, label: "Financement ministère"
      f.input :page_structure, default: false
      f.input :observatoire_egalite, default: false
      f.input :visible
      f.input :organization_type, as: :radio, collection: Organization::ORGANIZATION_TYPE, label: "Type"
      f.input :name, label: "Nom"
      f.input :city, label: "Ville"
      f.input :email
      f.input :website
      f.input :reseau
      f.input :organization, label: "Organization porteuse du prix", hint: "Remplir ce champ seulement si l'organization est un prix et qu'il depend d'une organisation"
    end
    f.actions
  end

  show do
    attributes_table do
      row :finance_ministre, default: false, label: "Financement ministère"
      row :page_structure, default: false
      row :observatoire_egalite, default: false
      row :visible
      row :organization_type, as: :radio, collection: Organization::ORGANIZATION_TYPE, label: "Type"
      row :name, label: "Nom"
      row :city, label: "Ville"
      row :organization, label: "Organization porteuse du prix", hint: "Remplir ce champ seulement si l'organization est un prix et qu'il depend d'une organisation"
      row :email
      row :website
      row :reseau
      row :chiffres_organizations do |obj|
        obj.chiffres_organizations.map { |chiffre| link_to(chiffre.annee, admin_organization_chiffres_organization_path(organization, chiffre)) }.compact
      end
    end
  end

  filter :organization_type
  filter :visible
  filter :name
  filter :city
  filter :created_at
  filter :titre
  filter :finance_ministre
  filter :page_structure
  filter :observatoire_egalite
end
