ActiveAdmin.register Help do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :sector, :structure_name, :start_date, :end_date, :help_amount, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :help_type, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :sector, :structure_name, :start_date, :end_date, :help_amount, :residence_condition, :general_condition, :specific_condition, :candidate_url, :institution_url, :selection, :compo_commission, :url_commission, :old_laureat, :old_laureat_url, :help_type, :admin_attachment, :artistic_attachment, :other_attachment, :contact_institution, :contact_institution_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :title
    column :structure_name
    column :description
    column :sector
    column :help_amount
    column :start_date
    column :end_date
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
