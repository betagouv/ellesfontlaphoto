ActiveAdmin.register ConseilsVideo do

  permit_params :title, :subtitle, :format, :objectif, :lecture_time, :contenu_explication, :liens_utiles, :protagoniste, :video, :image, :category_list

  before_create do |conseils_video|
    categories = []
    params["conseils_video"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_video.category_list = categories
    if params["conseils_video"]["video"].present?
      conseils_video.video = params["conseils_video"]["video"]
    end
    if params["conseils_video"]["image"].present?
      conseils_video.image = params["conseils_video"]["image"]
    end
  end

  before_update do |conseils_video|
    categories = []
    params["conseils_video"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_video.category_list = categories
    if params["conseils_video"]["video"].present?
      conseils_video.video = params["conseils_video"]["video"]
    end
    if params["conseils_video"]["image"].present?
      conseils_video.image = params["conseils_video"]["image"]
    end
  end

  filter :category_list
  filter :title
  filter :objectif
  filter :protagoniste
  filter :created_at
  filter :updated_at

  controller do
    def scoped_collection
      super.includes :notation_conseils_video # prevents N+1 queries to your database
    end
  end

  index do
    id_column
    column :category_list
    column :title
    column :objectif
    column :subtitle
    column :protagoniste
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :category_list
      row :title
      row :lecture_time
      row :objectif
      row :format
      row :subtitle
      row :protagoniste
      row :contenu_explication
      row :liens_utiles
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Bandeau" do
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES, label: "Categorie List"
      f.input :title, label: "Titre"
      f.input :lecture_time, label: "Temps de Lecture"
      f.input :objectif
      f.input :format, as: :select, collection: ConseilsVideo::VIDEO_FORMAT.keys
      f.input :subtitle, label: "Description"
    end
    f.inputs "Contenu" do
      f.input :protagoniste
      f.input :contenu_explication, as: :quill_editor, label: "Contenu explication"
    end
    f.inputs "Liens utiles" do
      f.input :liens_utiles, as: :quill_editor, label: "Liens utiles"
    end
    f.inputs "Multimedias" do
      if f.object.video.attached?
        f.input :video, as: :file, :hint => image_tag(f.object.video)
      else
        f.input :video, as: :file
      end
      if f.object.image.attached?
        f.input :image, as: :file, :hint => image_tag(f.object.image), label: "Image (dans le catalogue)"
      else
        f.input :image, as: :file, label: "Image (dans le catalogue)"
      end
    end
    f.actions
  end

  csv do
    column(:category_list) { |conseils_video| conseils_video.category.map { |c| c.name } }
    column :title
    column :lecture_time
    column :objectif
    column :format
    column :subtitle
    column :protagoniste
    column :contenu_explication
    column :liens_utiles
    column :created_at
    column :updated_at
  end
end
