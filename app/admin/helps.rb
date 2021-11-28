ActiveAdmin.register Help do
  permit_params :title, :description, :sector, :institution_name, :help_amount, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url, :example_enrollment_url, :faq_url, :issue_contact, :statistic, :end_date, :start_date, :identifiant, :institution_partenaire, :regularity, :description_url, :residence_time, :help_advantage, :old_laureats_case_url, :parentality, :accessibility, :contact_intitution_email, :contact_intitution_partenaire, :commission_parite, :old_laureats_parite, :visible
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :sector, :structure_name, :start_date, :end_date, :help_amount, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :help_type, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :visible
      row :identifiant
      row :title
      row :description
      row :sector
      row :type_list
      row :institution_name
      row :start_date
      row :end_date
      row :help_amount
      row :residence_condition
      row :general_condition
      row :specific_condition
      row :candidate_url
      row :institution_url
      row :selection
      row :compo_commission
      row :url_commission
      row :commission_parite
      row :old_laureat
      row :old_laureat_url
      row :old_laureats_parite
      row :admin_attachment
      row :artistic_attachment
      row :other_attachment
      row :contact_institution
      row :contact_institution_url
      row :contact_intitution_email
      row :contact_intitution_partenaire
      row :example_enrollment_url
      row :faq_url
      row :issue_contact
      row :statistic
      row :identifiant
      row :institution_partenaire
      row :regularity
      row :description_url
      row :residence_time
      row :help_advantage
      row :old_laureats_case_url
      row :parentality
      row :accessibility
    end
  end

  before_create do |help|
    help.type_list = params["help"]["type_list"]
  end

  before_update do |help|
    help.type_list = params["help"]["type_list"]
  end

  filter :identifiant
  filter :type
  filter :start_date
  filter :title
  filter :sector
  filter :objectif
  filter :institution_name

  index do
    column :visible
    column :identifiant
    column :title
    column :residence_condition
    column :sector
    column :type_list
    column :description
    column :start_date
    column :end_date
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Bandeau" do
      f.input :visible, as: :boolean, label: "Vibilité"
      f.input :identifiant,label: "identifiant"
      f.input :title, label: "Titre"
      f.input :type_list, :as => :check_boxes, :collection => Help::HELP_TYPE.keys, label: "Type"
      f.input :description, label: "Description"
      f.input :description_url, label: "Url de description"
      f.input :start_date, as: :date_picker, input_html: {style: "width:20%"}, label: "Date de début"
      f.input :end_date, as: :date_picker, input_html: {style: "width:20%"}, label: "Date de fin"
      f.input :sector, label: "Sécteur"
      f.input :regularity, label: "Régularité"
      f.input :help_amount, label: "Montant de l'aide"
      f.input :help_advantage, label: "Avantage de l'aide"
      f.input :residence_time, label: "Temps de résidence"
      f.input :residence_condition, as: :select, collection: Help::HELP_RESIDENCE, label: "Conditions de résidence"
      f.input :general_condition, label: "Conditions générales"
    end
    f.inputs "Candidatez" do
      f.input :candidate_url, label: "Url de candidature"
    end

    f.inputs "Selection" do
      f.input :selection, as: :quill_editor, label: "Sélection"
      f.input :example_enrollment_url, label: "Exemple d'inscription"
      f.input :compo_commission, as: :quill_editor, label: "Composition de la commission"
      f.input :url_commission, label: "URL de la commission"
      f.input :commission_parite, as: :select, collection: Help::PARITE, label: "Parité de la commission"
      f.input :old_laureat, as: :quill_editor, label: "Anciens lauréates"
      f.input :old_laureat_url, label: "Anciens lauréates url"
      f.input :old_laureats_case_url, label: "Anciens lauréates cas url"
      f.input :old_laureats_parite, as: :select, collection: Help::PARITE, label: "Anciens lauréates parité"
      f.input :statistic, as: :quill_editor, label: "Statistiques"
    end
    f.inputs "Pièces à fournir" do
      f.input :admin_attachment, as: :quill_editor, label: "Pièces jointes administratives"
      f.input :artistic_attachment, as: :quill_editor, label: "Pièces jointes artistiques"
      f.input :other_attachment, as: :quill_editor, label: "Autres pièces jointes"
      f.input :specific_condition, as: :quill_editor, label: "Conditions spécifiques"
      f.input :parentality, label: "Parentalité"
      f.input :accessibility, label: "Accéssibilité"
    end
    f.inputs "Contact" do
      f.input :institution_name, label: "Nom de l'institution"
      f.input :institution_url, label: "URL de l'institution"
      f.input :institution_partenaire, as: :quill_editor, label: "Institution partenaires"
      f.input :contact_institution, as: :quill_editor, label: "Contact institution"
      f.input :contact_intitution_email, as: :quill_editor, label: "Email contact institution"
      f.input :contact_intitution_partenaire, as: :quill_editor, label: "Contact institution partenaires"
      f.input :issue_contact, label: "Contact problèmes"
      f.input :faq_url, label: "FAQ url"
    end
    f.actions
  end

end
