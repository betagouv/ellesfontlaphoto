class ConseilsPratiquesController < ApplicationController
  def index
    @conseil_articles = ConseilsArticle.all
    @conseil_videos = ConseilsVideo.all
    @last_date_updated = [@conseil_articles.all.order(:created_at).last.created_at, @conseil_videos.all.order(:created_at).last.created_at.strftime("%d/%m/%Y")].max.strftime("%d/%m/%Y")
    @conseils = @conseil_articles + @conseil_videos
    @searched = false
    if params[:category_list].present?
      @conseil_articles = @conseil_articles.tagged_with(params[:category_list])
      @conseil_videos = @conseil_videos.tagged_with(params[:category_list])
      @conseils = @conseil_articles + @conseil_videos
      @selected = params[:category_list]
      @searched = true
    end
    # raise
    if params[:tag_list].present?
      @conseil_articles = @conseil_articles.tagged_with(params[:tag_list])
      @conseil_videos = @conseil_videos.tagged_with(params[:tag_list])
      @conseils = @conseil_articles + @conseil_videos
      @selected_tag = params[:tag_list]
      @searched = true
    end
    @conseils_count = @conseils.count
  end
end
