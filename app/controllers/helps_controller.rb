class HelpsController < ApplicationController
  def index
    @helps = Help.includes([:taggings])
    @helps = @helps.where(visible: true)
    @searched = false
    if params[:residence].present?
      if params[:residence] == "outre-mer"
        @helps = Help.where(residence_condition: ["Guadeloupe", "Guyane", "Martinique", "Mayotte", "Réunion", "Française résidant en outre-mer", "Française ou résidant en France", ""]).order(start_date: :asc)
      elsif params[:residence] == "Guadeloupe" || params[:residence] == "Guyane" || params[:residence] == "Martinique" || params[:residence] == "Mayotte" || params[:residence] == "Réunion"
        @helps = Help.where(residence_condition: [params[:residence], "Française résidant en outre-mer", "Française ou résidant en France", ""]).order(start_date: :asc)
      else
        @helps = Help.where(residence_condition: [params[:residence], "Française ou résidant en France", ""]).order(start_date: :asc)
      end
      @selected = params[:residence] == "Française résidant en outre-mer" ? "en outre-mer" : params[:residence]
      @searched = true
    end
    if params[:type_list].present?
      @helps = @helps.tagged_with(params[:type_list]).order(start_date: :asc)
      @selected_type = params[:type_list]
      @searched = true
    end
    # raise
    # @helps = @helps.sort_by {|help| help.candidature_dates.first.end_date }
    @helps = @helps.sort_by {|help| help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.nil? ? Date.today + 9000 : help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first.end_date }
    @helps_count = @helps.count
  end

  def show
    @help = Help.find(params[:id])
    next_date = @help.candidature_dates.where("start_date >= ?", Date.today).order("start_date ASC").first
    if next_date.nil?
      @help_status = "close"
    elsif next_date.start_date < Date.today && Date.today < next_date.end_date
      @help_status = "open"
    else
      @help_status = "close"
    end
    @notation_helps = NotationHelp.new
  end
end
