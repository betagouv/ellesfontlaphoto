class NotationCataloguesController < ApplicationController
  def create
    @notation_catalogue = NotationCatalogue.find_by(catalogue: params[:catalogue])
    if params[:answer] == "utile"
      @notation_catalogue.utile += 1
    end
    if params[:answer] == "inutile"
      @notation_catalogue.inutile += 1
    end
    if params[:answer] == "utile-mais-fermee"
      @notation_catalogue.utile_mais_fermee += 1
    end
    @notation_catalogue.save
    respond_to do |format|
      format.html { render 'helps/index' }
      format.json
    end
  end
end
