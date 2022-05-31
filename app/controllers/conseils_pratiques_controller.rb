class ConseilsPratiquesController < ApplicationController
  def index
    @conseil_articles = ConseilsArticle.all
    @conseil_videos = ConseilsVideo.all
    @webinaires = Webinaire.where("date <= ? OR page_rencontre = ?", Date.today, false)
    @contact = Contact.new
    @total_count = @conseil_articles.length + @conseil_videos.length + @webinaires.length
    unless @conseil_articles.empty? || @conseil_videos.empty?
      @last_date_updated = [@conseil_articles.all.order(:created_at).last.created_at, @conseil_videos.all.order(:created_at).last.created_at].max.strftime("%d/%m/%Y")
    end
    @searched = false
    if params[:category_list].present?
      @conseil_articles = @conseil_articles.tagged_with(params[:category_list].split(","), :any => true)
      @conseil_videos = @conseil_videos.tagged_with(params[:category_list].split(","), :any => true)
      @webinaires = @webinaires.tagged_with(params[:category_list].split(","), :any => true)
      @selected = params[:category_list]
      @searched = true
    end
    if params[:document_type].present?
      filter_document(params[:document_type])
      @selected_document = params[:document_type]
    end
    @conseils = @conseil_articles + @conseil_videos + @webinaires
    # if params[:tag_list].present?
    #   @conseil_articles = @conseil_articles.tagged_with(params[:tag_list])
    #   @conseil_videos = @conseil_videos.tagged_with(params[:tag_list])
    #   @conseils = @conseil_articles + @conseil_videos
    #   @selected_tag = params[:tag_list]
    #   @searched = true
    # end
    respond_to do |format|
      format.html
      format.text { render partial: 'main_index_conseils', locals: { conseils: @conseils, last_date_updated: @last_date_updated }, formats: [:html] }
    end
  end

  private

  def filter_document(query)
    query_array = query.split(",")
    if query_array.exclude?("fichepratique")
      @conseil_articles = []
    end
    if query_array.exclude?("webinaire")
      @webinaires = []
    end
    if query_array.exclude?("temoignage")
      @conseil_videos =[]
    end
  end
end
