class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.all.sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }.first(3)
  end

  def rencontre
  end
end
