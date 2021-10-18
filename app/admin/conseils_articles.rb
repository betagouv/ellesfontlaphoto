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

  index do
    column :title
    column :subtitle
    column :objectif
    column :auteur
    actions
  end

  form do |f|
    f.inputs "Filtres" do
      f.input :category
      f.input :tags
    end
    f.inputs "Bandeau" do
      f.input :title
      f.input :subtitle
      f.input :objectif
      f.input :lecture_time
    end
    f.inputs "Introduction" do
      f.input :introduction, input_html: {class: 'js-rich-text'}
    end
    f.inputs "En détails" do
      f.input :explication, input_html: {class: 'js-rich-text'}
      f.input :perspective, input_html: {class: 'js-rich-text'}
      f.input :citation
      f.input :citation_auteur
    end
    f.inputs "A retenir" do
      f.input :a_retenir
    end
    f.inputs "Liens utiles" do
      f.input :liens_utiles
    end
    f.inputs "Sources" do
      f.input :sources
    end
    f.inputs "Autrices, Auteurs" do
      f.input :auteur
    end
    f.actions
  end
end
