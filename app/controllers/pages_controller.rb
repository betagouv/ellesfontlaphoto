class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.all.where(visible: true).sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }.first(5)
    @conseils_articles = ConseilsArticle.order(:created_at).first(5)
    @conseils_videos = ConseilsVideo.order(:created_at).first(5)
    @webinaires = Webinaire.order(:created_at).first(5)
    @contenus = @helps + @conseils_videos + @conseils_articles + @webinaires
    @contenus = @contenus.shuffle
  end

  def rencontre
    @contact = Contact.new
    @webinaires = Webinaire.where("page_rencontre = ? OR date > ?", true, Date.today).order(:date)
  end
end
