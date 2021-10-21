ActiveAdmin.register Help do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :title, :description, :example_enrollment_url, :residence_time, :sector, :structure_name, :start_date, :end_date, :help_amount, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :help_type, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :sector, :structure_name, :start_date, :end_date, :help_amount, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :help_type, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :identifiant
    column :title
    column :residence_condition
    column :sector
    column :description
    column :start_date
    column :end_date
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Bandeau" do
      f.input :title
      f.input :description
      f.input :help_amount
      f.input :residence_time
      f.input :start_date, as: :date_picker, input_html: {style: "width:20%"}
      f.input :end_date, as: :date_picker, input_html: {style: "width:20%"}
      f.input :residence_condition
      f.input :general_condition
    end
    f.inputs "Candidatez" do
      f.input :candidate_url
    end
    f.inputs "Selection" do
      f.input :selection, as: :quill_editor
      f.input :example_enrollment_url
      f.input :compo_commission, as: :quill_editor
      f.input :url_commission
      f.input :old_laureat, as: :quill_editor
      f.input :old_laureat_url
    end
    f.inputs "Pièces à fournir" do
      f.input :admin_attachment, as: :quill_editor
      f.input :artistic_attachment, as: :quill_editor
      f.input :other_attachment, as: :quill_editor
      f.input :specific_condition, as: :quill_editor
      f.input :parentality
      f.input :accessibility
    end
    f.inputs "Contact" do
      f.input :institution_name
      f.input :institution_url
      f.inputs :contact_institution
      f.input :contact_intitution_email
      f.input :contact_intitution_partenaire
      f.input :faq_url
    end
    f.actions
  end

end
