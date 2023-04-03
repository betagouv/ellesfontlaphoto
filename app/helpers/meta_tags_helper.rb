module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
  
# ajout par jenn ci dessous d'une fonction pr enlever le nom beta.gouv 

  def meta_product_name
    meta_product_name = (content_for?(:meta_product_name) ? content_for(:meta_product_name) : DEFAULT_META["meta_product_name"])
  end
end
