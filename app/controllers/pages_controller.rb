class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.includes([:taggings]).order(start_date: :asc).first(3)
  end

  def mentions_legales
  end

  def a_propos
  end

  def donnees_personelles
  end
end
