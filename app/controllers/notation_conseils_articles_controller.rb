class NotationConseilsArticlesController < ApplicationController
  def create
    @conseil = ConseilsArticle.find(params[:conseil_id])
    @notation_conseil_article = NotationConseilsArticle.find_by(conseils_article: @conseil)
    if params[:answer] == "utile"
      unless @notation_conseil_article
        @notation_conseil_article = NotationConseilsArticle.new(conseils_article: @conseil)
      end
      @notation_conseil_article.utile += 1
    end
    if params[:answer] == "inutile"
      unless @notation_conseil_article
        @notation_conseil_article = NotationConseilsArticle.new(conseils_article: @conseil)
      end
      @notation_conseil_article.inutile += 1
    end
    @notation_conseil_article.save
    respond_to do |format|
      format.html { render 'conseils_pratiques/index' }
      format.json
    end
  end
end
