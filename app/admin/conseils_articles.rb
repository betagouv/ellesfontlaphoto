ActiveAdmin.register ConseilsArticle do

  permit_params :title, :subtitle, :category_list, :objectif, :lecture_time, :introduction, :explication, :perspective, :citation, :liens_utiles, :auteur, :citation_auteur, :a_retenir, :sources, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :category, :objectif, :lecture_time, :introduction, :explication, :perspective, :citation, :liens_utiles, :auteur, :citation_auteur, :a_retenir, :sources, :tag_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  before_create do |conseils_article|
    categories = []
    params["conseils_article"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_article.category_list = categories
    conseils_article.tag_list = params["conseils_article"]["tag_list"]
  end

  before_update do |conseils_article|
    categories = []
    params["conseils_article"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_article.category_list = categories
    conseils_article.tag_list = params["conseils_article"]["tag_list"]
  end

  filter :title
  filter :subtitle
  filter :tags
  filter :category
  filter :auteur
  filter :objectif
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :title
      row :subtitle
      row :category_list
      row :tag_list
      row :objectif
      row :lecture_time
      row :introduction
      row :explication
      row :perspective
      row :citation
      row :liens_utiles
      row :auteur
      row :citation_auteur
      row :a_retenir
      row :sources
    end
  end

  index do
    id_column
    column :title
    column :subtitle
    column :auteur
    column :objectif
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Bandeau" do
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES.keys
      f.input :tag_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_TAGS
      f.input :title
      f.input :subtitle
      f.input :lecture_time
      f.input :objectif
    end
    f.inputs "Introduction" do
      f.input :introduction, as: :quill_editor
    end
    f.inputs "En détails" do
      f.input :explication, as: :quill_editor
      f.input :perspective, as: :quill_editor
      f.input :citation
      f.input :citation_auteur
    end
    f.inputs "A retenir" do
      f.input :a_retenir, as: :quill_editor
    end
    f.inputs "Liens utiles" do
      f.input :liens_utiles, as: :quill_editor
    end
    f.inputs "Sources et Autrices/Auteurs" do
      f.input :sources
      f.input :auteur
    end
    f.actions
  end

end
