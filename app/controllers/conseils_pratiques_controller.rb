class ConseilsPratiquesController < ApplicationController
  def index
    @conseil_articles = ConseilsArticle.all
    @conseil_videos = ConseilsVideo.all
    @last_date_updated = [@conseil_articles.all.order(:created_at).last.created_at, @conseil_videos.all.order(:created_at).last.created_at.strftime("%d/%m/%Y")].max.strftime("%d/%m/%Y")
    @conseils = @conseil_articles + @conseil_videos
    @searched = false
    if params[:category].present?
      # raise
      @conseil_articles = @conseil_articles.where("category @> ?", "{#{params[:category]}}").order(created_at: :asc)
      @conseil_videos = @conseil_videos.where("category @> ?", "{#{params[:category]}}").order(created_at: :asc)
      @conseils = @conseil_articles + @conseil_videos
      @selected = params[:category]
      @searched = true
    end
    if params[:tags].present?
      @conseil_articles = @conseil_articles.where("tags @> ?", "{#{params[:tags]}}").order(created_at: :asc)
      @conseil_videos = @conseil_videos.where("tags @> ?", "{#{params[:tags]}}").order(created_at: :asc)
      @conseils = @conseil_articles + @conseil_videos
      @selected_tag = params[:tags]
      @searched = true
    end
    @conseils_count = @conseils.count
  end
end
