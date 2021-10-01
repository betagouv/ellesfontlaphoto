class PagesController < ApplicationController
  def home
    @contact = Contact.new
    @helps = Help.order(start_date: :asc).first(3)
  end

  def mentions_legales
  end
end
