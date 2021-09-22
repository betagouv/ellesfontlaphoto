class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def mentions_legales
  end
end
