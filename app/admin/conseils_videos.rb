ActiveAdmin.register ConseilsVideo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :category, :tags, :format, :objectif, :lecture_time, :contenu_explication, :liens_utiles, :protagoniste
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :category, :tags, :format, :objectif, :lecture_time, :contenu_explication, :liens_utiles, :protagoniste]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :title
    column :subtitle
    column :protagoniste
    column :format
    column :objectif
    actions
  end

end
