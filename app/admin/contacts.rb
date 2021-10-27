ActiveAdmin.register Contact do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :contact_email, :contact_type, :comment, :message
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :contact_type, :comment, :message]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :contact_email
      row :contact_type
      row :message
      row :comment
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Contact" do
      f.input :contact_email, input_html: { disabled: true }
      f.input :contact_type, input_html: { disabled: true }
      f.input :message, input_html: { disabled: true }
      f.input :comment, as: :quill_editor
    end
  end
end
