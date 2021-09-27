class HelpsController < ApplicationController

  def index
    @helps = Help.order(start_date: :asc)
    @searched = false
    if params[:query_residence].present?
      # @helps = Help.order(start_date: :asc).search_by_residence_condition([params[:query_residence], "Française ou résidant en France"])
      @helps = Help.where(residence_condition: [params[:query_residence], "Française ou résidant en France"]).order(start_date: :asc)
      @selected = params[:query_residence]
      @searched = true
    end
    if params[:query_type].present?
      @helps = @helps.where(help_type: Help::HELP_TYPE.key(params[:query_type]).to_s).order(start_date: :asc)
      @selected_type = params[:query_type]
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
