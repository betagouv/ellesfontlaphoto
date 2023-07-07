ActiveAdmin.register Webinaire do
  TYPE_RENCONTRE = [
    ["webinaire", "webinaire", checked: true],
    ["outil d'entraide", "outil d'entraide"],
    ["atelier", "atelier"],
  ]

  permit_params :titre, :date, :lieu, :category_list, :type_list, :description, :participant, :url, :url_inscription, images: []

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
      row :type_list
      row :category_list
      row :titre
      row :date
      row "Url Replay", :url
      row :url_inscription
      row "Images" do |m|
        m.images.each do |img|
          span do
            image_tag img, style: 'max-width: 450px; max-height:450px;'
          end
        end
      end
      row "Intervenantes", :participant
      row :description
    end
  end

  index do
    column :id
    column :titre
    column :date
    column :type_list
    column :category_list
    column "Url Replay", :url
    column :url_inscription
    column "Intervenantes", :participant
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Infos" do
      f.input :type_list, :as => :radio, \
      :collection => TYPE_RENCONTRE, label: "Type de Rencontre"
      f.input :category_list, :as => :check_boxes, \
        :collection => ConseilsVideo::CONSEIL_CATEGORIES, label: "Categorie List"
      f.input :titre
      f.input :participant, label: "Intervenant.e.s ⚠️ Ne pas préciser 'avec'"
      f.input :date
      f.input :url_inscription
    end
    f.inputs "Infos complémentaires" do
      if f.object.images.attached?
        f.object.images.each do |i|
          f.input :images, as: :file, :hint => image_tag(i), input_html: { multiple: true }
        end
      else
        f.input :images, as: :file, input_html: { multiple: true }
      end
      f.input :url, label: "Url Replay"
      f.input :description
    end
    f.actions
  end

end
