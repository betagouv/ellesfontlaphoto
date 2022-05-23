ActiveAdmin.register Webinaire do
  permit_params :titre, :date, :lieu, :description, :sous_titre, :participant, :url, :page_rencontre, :url_inscription, images: []

  show do
    attributes_table do
      row :id
      row :page_rencontre
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
    column :titre
    column :sous_titre
    column :date
    column :url
    column :url_inscription
    column :participant
    column :description
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Webinaire" do
      f.input :page_rencontre, as: :boolean
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
      f.input :participant
      f.input :description
    end
    f.actions
  end
end
