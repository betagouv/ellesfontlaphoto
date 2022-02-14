class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.includes([:taggings])
    @helps = @helps.sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }.first(3)
  end

  def mentions_legales
  end

  def a_propos
  end

  def donnees_personelles
  end
end
