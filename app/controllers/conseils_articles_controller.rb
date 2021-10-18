class ConseilsArticlesController < ApplicationController
  def show
    @conseil_article = ConseilsArticle.find(params[:id])
  end
end
