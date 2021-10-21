ActiveAdmin.register ConseilsVideo do

  permit_params :title, :subtitle, :category_list, :format, :objectif, :lecture_time, :contenu_explication, :liens_utiles, :protagoniste, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :category, :format, :objectif, :lecture_time, :contenu_explication, :liens_utiles, :protagoniste, :tag_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  before_create do |conseils_video|
    categories = []
    params["conseils_video"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_video.category_list = categories
    conseils_video.tag_list = params["conseils_video"]["tag_list"]
  end

  before_update do |conseils_video|
    categories = []
    params["conseils_video"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_video.category_list = categories
    conseils_video.tag_list = params["conseils_video"]["tag_list"]
  end

  filter :title
  filter :tags
  filter :category_list
  filter :protagoniste
  filter :objectif
  filter :created_at
  filter :updated_at

  index do
    id_column
    column :title
    column :subtitle
    column :objectif
    column :protagoniste
    column :created_at
    column :updated_at
    column :category_list
    column :tag_list
    actions
  end

  show do
    attributes_table do
      row :title
      row :subtitle
      row :category_list
      row :format
      row :objectif
      row :lecture_time
      row :contenu_explication
      row :liens_utiles
      row :protagoniste
      row :tag_list
    end
  end

  form do |f|
    f.inputs "Bandeau" do
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES.keys
      f.input :tag_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_TAGS
      f.input :title
      f.input :format, as: :select, collection: ConseilsVideo::VIDEO_FORMAT.keys
      f.input :protagoniste
      f.input :lecture_time
      f.input :objectif
    end
    f.inputs "Description" do
      f.input :subtitle
      f.input :objectif, as: :quill_editor
    end
    f.inputs "Protagoniste" do
      f.input :contenu_explication, as: :quill_editor
    end
    f.inputs "Liens utiles" do
      f.input :liens_utiles, as: :quill_editor
    end
    f.actions
  end

end
