class HelpsController < ApplicationController

  def index
    @helps = Help.order(start_date: :asc)
    @searched = false
    if params[:residence].present?
      params[:residence] = "Française résidant en outre-mer" if params[:residence] == "en outre-mer"
      # @helps = Help.order(start_date: :asc).search_by_residence_condition([params[:residence], "Française ou résidant en France"])
      @helps = Help.where(residence_condition: [params[:residence], "Française ou résidant en France"]).order(start_date: :asc)
      @selected =  params[:residence] == "Française résidant en outre-mer" ? "en outre-mer" : params[:residence]
      @searched = true
    end
    # raise
    if params[:type_list].present?
      @helps = @helps.tagged_with(params[:type_list]).order(start_date: :asc)
      @selected_type = params[:type_list]
      @searched = true
    end
    @helps_count = @helps.count
  end

  def show
    @help = Help.find(params[:id])
    # if Help::HELP_MONTH_TRANSLATE[@help.start_month.to_sym].to_date < Date.today && Date.today < Help::HELP_MONTH_TRANSLATE[@help.end_month.to_sym].to_date.end_of_month
    if @help.start_date < Date.today && Date.today < @help.end_date
      @help_status = "open"
    else
      @help_status = "close"
    end
  end
end
