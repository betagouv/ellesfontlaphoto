ActiveAdmin.register Organization do
  permit_params :organization_type, :name, :city, :nb_women_dir, :total_nb_dir, :nb_women_expos, :total_nb_expos, :dir_parity, :expos_parity, :score_parity, :logo, :request_info_count

  before_destroy do |organization|
    organization.logo.purge
  end

  after_create do |organization|
    organization.organization_type = params["organization"]["organization_type"].second

    if organization.nb_women_dir && organization.total_nb_dir
      organization.dir_parity = organization.nb_women_dir.fdiv(organization.total_nb_dir) >= 0.5
    end

    if organization.nb_women_expos && organization.total_nb_expos
      organization.expos_parity = organization.nb_women_expos.fdiv(organization.total_nb_expos) * 100
    end

    if organization.dir_parity == nil
      organization.score_parity = organization.expos_parity ? 2 : 0
    elsif organization.expos_parity == nil
      organization.score_parity = organization.dir_parity ? 2 : 0
    elsif organization.dir_parity && organization.expos_parity
      organization.score_parity = 2
    elsif organization.dir_parity || organization.expos_parity
      organization.score_parity = 1
    else
      organization.score_parity = 0
    end

  end


  after_update do |organization|
    organization.organization_type = params["organization"]["organization_type"].second

    if organization.nb_women_dir && organization.total_nb_dir
      organization.dir_parity = organization.nb_women_dir.fdiv(organization.total_nb_dir) >= 0.5
    end
    if organization.nb_women_expos && organization.total_nb_expos
      organization.expos_parity = organization.nb_women_expos.fdiv(organization.total_nb_expos) * 100
    end

    if organization.dir_parity == nil
      organization.score_parity = organization.expos_parity ? 2 : 0
    elsif organization.expos_parity == nil
      organization.score_parity = organization.dir_parity ? 2 : 0
    elsif organization.dir_parity && organization.expos_parity
      organization.score_parity = 2
    elsif organization.dir_parity || organization.expos_parity
      organization.score_parity = 1
    else
      organization.score_parity = 0
    end

    organization.save
  end

  index do
    column :id
    column :organization_type
    column :name
    column :city
    column :score_parity
    column :request_info_count
  end

  form do |f|
    f.semantic_errors
    f.inputs "Organisation" do
      f.input :organization_type, :as => :check_boxes, :collection => Organization::ORGANIZATION_TYPE, label: "Type"
      f.input :name, label: "Nom"
      f.input :city, label: "Ville"
      if f.object.logo.attached?
        f.input :logo, as: :file, :hint => image_tag(f.object.logo)
      else
        f.input :logo, as: :file
      end
      f.input :nb_women_dir, label: "Nombre de femmes à la direction"
      f.input :total_nb_dir, label: "Nombre total de personnes à la direction"
      f.input :nb_women_expos, label: "Nombre de femmes exposées"
      f.input :total_nb_expos, label: "Nombre total de personnes exposés"
    end
    f.actions
  end

end
