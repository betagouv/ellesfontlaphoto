class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.all.sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }.first(3)
  end

  def rencontre
    @contact = Contact.new
    @webinaires = Webinaire.where("page_rencontre = ?", true).order(:date)
  end
end
