ActiveAdmin.register Organization do
  permit_params :visible, :organization_type, :name, :city, :titre, :nb_women_dir, :total_nb_dir, :nb_women_expos, :total_nb_expos, :dir_parity, :expos_parity, :score_parity, :logo, :request_info_count, :nb_femmes_laureates, :nb_total_laureates, :nb_femmes_candidates, :nb_total_candidats, :nb_femmes_publiees, :nb_total_publies, :nb_femmes_iconographes, :nb_total_iconographes, :nb_femmes_enseignantes, :nb_total_enseignants, :nb_femmes_etudiantes, :nb_total_etudiants

  before_destroy do |organization|
    organization.logo.purge
  end

  after_create do |organization|
    organization.organization_type = params["organization"]["organization_type"]
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
    column :score_parity
    column :request_info_count
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Organisation" do
      f.input :visible
      f.input :organization_type, as: :radio, collection: Organization::ORGANIZATION_TYPE, label: "Type"
      f.input :name, label: "Nom"
      f.input :city, label: "Ville"
      f.inputs "Festival ou Espace d'exposition" do
        f.input :nb_women_dir, label: "Nombre de femmes à la direction"
        f.input :total_nb_dir, label: "Nombre total de personnes à la direction"
        f.input :nb_women_expos, label: "Nombre de femmes exposées"
        f.input :total_nb_expos, label: "Nombre total de personnes exposés"
      end
      f.inputs "Prix" do
        f.input :titre, label: "Titre du prix"
        f.input :nb_femmes_laureates, label: "Nombre de femmes lauréates"
        f.input :nb_total_laureates, label: "Nombre total de personnes lauréates"
        f.input :nb_femmes_candidates, label: "Nombre de femmes candidates"
        f.input :nb_total_candidats, label: "Nombre total de candidats"
      end
      f.inputs "Journal/Magazine" do
        f.input :nb_femmes_publiees, label: "Nombre de femmes publiées"
        f.input :nb_total_publies, label: "Nombre total de personnes publiés"
        f.input :nb_femmes_iconographes, label: "Nombre de femmes iconographes"
        f.input :nb_total_iconographes, label: "Nombre total d'iconographes"
      end
      f.inputs "École" do
        f.input :nb_femmes_enseignantes, label: "Nombre de femmes enseignantes"
        f.input :nb_total_enseignants, label: "Nombre total d'enseignants"
        f.input :nb_femmes_etudiantes, label: "Nombre de femmes étudiantes"
        f.input :nb_total_etudiants, label: "Nombre total d'étudiants"
      end
    end
    f.actions
  end

end
