ActiveAdmin.register ConseilsArticle do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :category, :tags, :objectif, :lecture_time, :introduction, :explication, :perspective, :citation, :liens_utiles, :sources, :auteur, :citation_auteur, :a_retenir
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :category, :tags, :objectif, :lecture_time, :introduction, :explication, :perspective, :citation, :liens_utiles, :sources, :auteur, :citation_auteur, :a_retenir]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  before_create do
    raise
  end

  before_update do
    params[:conseils_article][:tags] = params[:conseils_article][:tags].reject(&:empty?)
    params[:conseils_article][:category] = params[:conseils_article][:category].reject(&:empty?)
    params[:conseils_article][:liens_utiles] = params[:conseils_article][:liens_utiles].split(",").reject(&:empty?)
    # raise
  end

  index do
    column :title
    column :subtitle
    column :objectif
    column :auteur
    actions
  end

  form do |f|
    f.inputs "Filtres" do
      f.input :category, :as => :select, input_html: { multiple: true }, :collection => ConseilsArticle::CONSEIL_CATEGORIES.keys
      f.input :tags, :as => :select, input_html: { multiple: true }, :collection => ConseilsArticle::CONSEIL_TAGS
    end
    f.inputs "Bandeau" do
      f.input :title
      f.input :subtitle
      f.input :objectif
      f.input :lecture_time
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
      f.array :liens_utiles, as: :array
    end
    f.inputs "Sources" do
      f.input :sources, as: :quill_editor
    end
    f.inputs "Autrices, Auteurs" do
      f.input :auteur
    end
    f.actions
  end
end
