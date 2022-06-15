class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.all.where(visible: true).sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }.first(3)
    @conseils_articles = ConseilsArticle.order(:created_at).first(3)
    @conseils_videos = ConseilsVideo.order(:created_at).first(3)
    @webinaires = Webinaire.order(:created_at).first(3)
    @contenus = @helps + @conseils_videos + @conseils_articles + @webinaires
    @contenus.sort! do |a, b|
      if b.class == Webinaire
        b.date <=> a.created_at
      elsif (b.class == ConseilsArticle) || (b.class == ConseilsVideo) || (b.class == Help)
        b.created_at <=> a.created_at
      end
    end
  end

  def rencontre
    @contact = Contact.new
    @webinaires = Webinaire.where("page_rencontre = ?", true).order(:date)
  end
end
