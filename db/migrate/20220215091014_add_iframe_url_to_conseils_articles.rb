class AddIframeUrlToConseilsArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :conseils_articles, :iframe_url, :string
  end
end
