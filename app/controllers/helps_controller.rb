class HelpsController < ApplicationController

  def index
    @helps = Help.all
  end

  def show
    @help = Help.find(params[:id])
    if Help::HELP_MONTH_TRANSLATE[@help.start_month.to_sym].to_date < Date.today && Date.today < Help::HELP_MONTH_TRANSLATE[@help.end_month.to_sym].to_date.end_of_month
      @help_status = "open"
    else
      @help_status = "close"
    end
  end
end
