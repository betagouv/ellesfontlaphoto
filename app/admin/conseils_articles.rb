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
    conseils_article.category_list = params["conseils_article"]["category_list"].reject{ |c| c.empty? }
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
      row :citation_auteur
      row :liens_utiles
      row :auteur
      row :a_retenir
      row :sources
    end
  end

  controller do
    def scoped_collection
      super.includes :notation_conseils_article # prevents N+1 queries to your database
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
    column :utile, sortable: 'notation_conseils_article.utile' do |conseils_article|
      if NotationConseilsArticle.find_by(conseils_article: conseils_article)
        NotationConseilsArticle.find_by(conseils_article: conseils_article).utile
      end
    end
    column :inutile, sortable: 'notation_conseils_article.inutile' do |conseils_article|
      if NotationConseilsArticle.find_by(conseils_article: conseils_article)
        NotationConseilsArticle.find_by(conseils_article: conseils_article).inutile
      end
    end
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Bandeau" do
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES.keys, label: "Categorie List"
      f.input :tag_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_TAGS, label: "List Tags"
      f.input :title, label: "Titre"
      f.input :subtitle, label: "Sous titre"
      f.input :lecture_time, label: "Temps de Lecture (chiffre)"
      f.input :objectif
    end
    f.inputs "Introduction" do
      f.input :introduction, as: :quill_editor
    end
    f.inputs "En détails" do
      f.input :explication, as: :quill_editor
      f.input :perspective, as: :quill_editor
      f.input :citation, as: :quill_editor
      f.input :citation_auteur, label: "Autrice/eur de la citation"
    end
    f.inputs "A retenir" do
      f.input :a_retenir, as: :quill_editor, label: "A retenir"
    end
    f.inputs "Liens utiles" do
      f.input :liens_utiles, as: :quill_editor, label: "Liens Utiles (⚠️: FAIRE UNE LISTE ICI)"
    end
    f.inputs "Sources et Autrices/Auteurs" do
      f.input :sources
      f.input :auteur
    end
    f.actions
  end

end
