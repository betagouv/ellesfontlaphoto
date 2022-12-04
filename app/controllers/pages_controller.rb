class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.all.where(visible: true).sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }.first(5)
    @conseils_articles = ConseilsArticle.order(created_at: :desc).first(5)
    @conseils_videos = ConseilsVideo.order(created_at: :desc).first(5)
    @webinaires = Webinaire.order(created_at: :desc).first(5)
    @contenus = @helps + @conseils_videos + @conseils_articles + @webinaires
    @contenus.sort! do |a, b|
      if b.class == Webinaire
        b.date <=> a.created_at
      elsif (b.class == ConseilsArticle) || (b.class == ConseilsVideo) || (b.class == Help)
        b.created_at <=> a.created_at
      end
    end
  end

  def entraide
    @contact = Contact.new
    @case_review = CaseReview.new
    @webinaires = Webinaire.all
  end

  def chiffres_inegalites
    @organizations = Organization.where(visible: true).first(8)
    if request.user_agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
      @organizations = Organization.where(visible: true).first(9)
    end
    @contact = Contact.new
  end

end
