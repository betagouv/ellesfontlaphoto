class HelpsController < ApplicationController

  def index
    if params[:query_residence].present?
      @helps = Help.search_by_residence_condition(params[:query_residence])
      @selected = params[:query_residence]
      @searched = true
    else
      @helps = Help.all
      @searched = false
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
