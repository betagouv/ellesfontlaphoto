class NotationConseilsArticlesController < ApplicationController
  def create
    if NotationConseilsArticle::ANSWERS.include?(params[:answer])
      @conseil = ConseilsArticle.find(params[:conseil_id])
      @notation_conseil_article = NotationConseilsArticle.new(conseils_article: @conseil, comment: params[:comment])
      @notation_conseil_article.suggestion = params[:sugg].join(", ") if params[:sugg]
      @notation_conseil_article.comment = params[:comment] if params[:comment]
      if params[:answer] == "utile"
        @notation_conseil_article.utile = 1
      elsif params[:answer] == "inutile"
        @notation_conseil_article.inutile = 1
      end
      @notation_conseil_article.save
      respond_to do |format|
        format.html { redirect_to conseil_path(@conseil) }
        format.json
      end
    end
  end

end
