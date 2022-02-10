require 'pry'
class HelpsController < ApplicationController
  def index
    @helps = Help.all.where(visible: true)
    @searched = false
    if params[:residence].present?
      if params[:residence] == "outre-mer"
        @helps = Help.where(residence_condition: ["Guadeloupe", "Guyane", "Martinique", "Mayotte", "Réunion", "Française résidant en outre-mer", "Française ou résidant en France", "", "Résidant en France"])
      elsif params[:residence] == "Guadeloupe" || params[:residence] == "Guyane" || params[:residence] == "Martinique" || params[:residence] == "Mayotte" || params[:residence] == "Réunion"
        @helps = Help.where(residence_condition: [params[:residence], "Française résidant en outre-mer", "Résidant en France", ""])
      elsif params[:residence] == "France"
        @helps = Help.where.not(residence_condition: "Française ou résidant en France").order(start_date: :asc)
      elsif params[:residence] == "À l'étranger"
        @helps = Help.where(residence_condition: "Française ou résidant en France").order(start_date: :asc)
      else
        @helps = Help.where(residence_condition: [params[:residence], "Française ou résidant en France", "Résidant en France", ""]).order(start_date: :asc)
      end
      @selected = params[:residence] == "Française résidant en outre-mer" ? "en outre-mer" : params[:residence]
      @searched = true
    end
    if params[:type_list].present?
      @helps = @helps.tagged_with(params[:type_list])
      @selected_type = params[:type_list]
      @searched = true
    end
    @helps = @helps.sort_by do |help|
      if help.candidature_dates.where("start_date >= ?", Date.today).order("start_date ASC").first.nil?
        if help.permanent
          Date.today
        else
          Date.today + 9000
        end
      else
        help.candidature_dates.where("start_date >= ?", Date.today).order("start_date ASC").first.start_date
      end
    end
    @helps_count = @helps.count
  end

  def show
    @help = Help.find(params[:id])
    next_start_date = @help.candidature_dates.where("start_date >= ?", Date.today).order("start_date ASC").first
    next_end_date = @help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first
    unless next_end_date.nil?
      if (next_end_date.start_date < Date.today && Date.today < next_end_date.end_date) || (next_start_date.start_date < Date.today && Date.today < next_start_date.end_date)
        @help_status = "open"
      elsif next_start_date.nil? || next_start_date.start_date > Date.today
        @help_status = "close"
      end
    else
      @help_status = "close"
    end
    @notation_helps = NotationHelp.new
  end
end
