ActiveAdmin.register ConseilsArticle do
  permit_params :title, :subtitle, :category_list, :objectif, :lecture_time, :introduction, :explication, :citation, :liens_utiles, :auteur, :citation_auteur, :a_retenir, :sources

  before_create do |conseils_article|
    categories = []
    params["conseils_article"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    conseils_article.category_list = categories
  end

  before_update do |conseils_article|
    conseils_article.category_list = params["conseils_article"]["category_list"].reject{ |c| c.empty? }
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
      row :category_list
      row :title
      row :subtitle
      row :lecture_time
      row :objectif
      row :introduction
      row :a_retenir
      row :explication
      row :citation
      row :citation_auteur
      row :liens_utiles
      row :sources
      row :auteur
    end
  end

  controller do
    def scoped_collection
      super.includes :notation_conseils_article # prevents N+1 queries to your database
    end
  end

  index do
    column :id
    column :title
    column :subtitle
    column :objectif
    column :auteur
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Bandeau" do
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES, label: "Categorie List"
      f.input :title, label: "Titre"
      f.input :subtitle, label: "Sous titre"
      f.input :lecture_time, label: "Temps de Lecture (chiffre)"
      f.input :objectif
    end
    f.inputs "Introduction" do
      f.input :introduction, as: :quill_editor
    end
    f.inputs "A retenir" do
      f.input :a_retenir, as: :quill_editor, label: "A retenir"
    end
    f.inputs "En détails" do
      f.input :explication, as: :quill_editor
      f.input :citation, as: :quill_editor
      f.input :citation_auteur, label: "Autrice/eur de la citation"
    end
    f.inputs "Liens utiles" do
      f.input :liens_utiles, as: :quill_editor, label: "Liens Utiles (⚠️: FAIRE UNE LISTE ICI)"
    end
    f.inputs "Sources et Autrices/Auteurs" do
      f.input :sources
      f.input :auteur, as: :quill_editor
    end
    f.actions
  end


  csv do
    column(:category_list) { |conseils_article| conseils_article.category.map { |c| c.name } }
    column :title
    column :subtitle
    column :lecture_time
    column :objectif
    column :introduction
    column :a_retenir
    column :explication
    column :citation
    column :citation_auteur
    column :liens_utiles
    column :sources
    column :auteur
    column :created_at
    column :updated_at
  end
end
