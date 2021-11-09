class HelpsController < ApplicationController

  def index
    @helps = Help.order(start_date: :asc)
    @searched = false
    if params[:residence].present?
      if params[:residence] == "outre-mer"
        @helps = Help.where(residence_condition: ["Guadeloupe", "Guyane", "Martinique", "Mayotte", "Réunion", "Française ou résidant en France"]).order(start_date: :asc)
      else
        @helps = Help.where(residence_condition: [params[:residence], "Française ou résidant en France"]).order(start_date: :asc)
      end
      @selected = params[:residence] == "Française résidant en outre-mer" ? "en outre-mer" : params[:residence]
      @searched = true
    end
    if params[:type_list].present?
      @helps = @helps.tagged_with(params[:type_list]).order(start_date: :asc)
      @selected_type = params[:type_list]
      @searched = true
    end
    @helps_count = @helps.count
  end

  def show
    @help = Help.find(params[:id])
    if @help.start_date < Date.today && Date.today < @help.end_date
      @help_status = "open"
    else
      @help_status = "close"
    end
  end
end
