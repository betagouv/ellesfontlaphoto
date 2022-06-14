ActiveAdmin.register Webinaire do
  permit_params :titre, :date, :lieu, :category_list, :type_list, :description, :sous_titre, :participant, :url, :page_rencontre, :url_inscription, :show_date, :show_visio, images: []

  before_create do |webinaire|
    categories = []
    params["webinaire"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    webinaire.category_list = categories
    webinaire.type_list = params["webinaire"]["type_list"]
  end

  before_update do |webinaire|
    categories = []
    params["webinaire"]["category_list"].reject{ |c| c.empty? }.each do |category|
      categories << category
    end
    webinaire.category_list = categories
    webinaire.type_list = params["webinaire"]["type_list"]
  end

  show do
    attributes_table do
      row :id
      row :page_rencontre
      row :show_date
      row :show_visio
      row :type_list
      row :category_list
      row :titre
      row :sous_titre
      row :date
      row :url
      row :url_inscription
      row "Images" do |m|
        m.images.each do |img|
          span do
            image_tag img, style: 'max-width: 450px; max-height:450px;'
          end
        end
      end
      row :participant
      row :description
    end
  end

  index do
    column :id
    column :page_rencontre
    column :show_date
    column :show_visio
    column :titre
    column :sous_titre
    column :date
    column :type_list
    column :category_list
    column :url
    column :url_inscription
    column :participant
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Webinaire" do
      f.input :page_rencontre, as: :boolean
      f.input :show_date, as: :boolean, label: "Afficher la date"
      f.input :show_visio, as: :boolean, label: "Afficher visio"
      f.input :type_list, :as => :radio, \
      :collection => Webinaire::TYPE_RENCONTRE, label: "Type de Rencontre"
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES, label: "Categorie List"
      f.input :titre
      f.input :sous_titre
      f.input :date
      f.input :url
      f.input :url_inscription
      if f.object.images.attached?
        f.object.images.each do |i|
          f.input :images, as: :file, :hint => image_tag(i), input_html: { multiple: true }
        end
      else
        f.input :images, as: :file, input_html: { multiple: true }
      end
      f.input :participant, label: "Participant.e.s ⚠️ Ne pas préciser 'avec'"
      f.input :description
    end
    f.actions
  end

end
