class HelpsController < ApplicationController
  def index
    @helps = Help.all.where(visible: true)
    @searched = false
    if params[:residence].present?
      if params[:residence] == "Outre-mer"
        @helps = Help.where(residence_condition: ["Guadeloupe", "Guyane", "Martinique", "Mayotte", "Réunion", "Française résidant en outre-mer", "Française ou résidant en France", ""])
      elsif params[:residence] == "Guadeloupe" || params[:residence] == "Guyane" || params[:residence] == "Martinique" || params[:residence] == "Mayotte" || params[:residence] == "Réunion"
        @helps = Help.where(residence_condition: [params[:residence], "Française résidant en outre-mer", "Française ou résidant en France", ""])
      elsif params[:residence] == "À l'étranger"
        @helps = Help.where(residence_condition: [params[:residence], "Française résidant à l'étranger", "Française ou résidant en France", ""])
      elsif params[:residence] == "France"
        @helps = Help.where.not(residence_condition: ["Française résidant à l'étranger"])
      else
        @helps = Help.where(residence_condition: [params[:residence], "Française ou résidant en France", ""])
      end
      @selected = params[:residence] == "Française résidant en outre-mer" ? "en Outre-mer" : params[:residence]
      @searched = true
    end
    if params[:type_list].present?
      @helps = @helps.tagged_with(params[:type_list])
      @selected_type = params[:type_list]
      @searched = true
    end
    @helps = @helps.order(:end_date)
    @helps_count = @helps.count
  end

  def show
    @help = Help.find(params[:id])
    @review = Review.new
    @evaluation_help = EvaluationHelp.new
    @reviews = @help.reviews
    # raise
    @dossier_grades_count = @help.evaluation_helps.where.not(eval_dossier: nil).count
    @dossier_grade = @dossier_grades_count == 0 ? nil : (@help.evaluation_helps.sum(:eval_dossier) / @dossier_grades_count.to_f).round()
    @dispositif_grades_count = @help.evaluation_helps.where.not(eval_dispositif: nil).count
    @dispositif_grade = @dispositif_grades_count == 0 ? nil : (@help.evaluation_helps.sum(:eval_dispositif) / @dispositif_grades_count.to_f).round()
    next_date = @help.candidature_dates.where("end_date >= ?", Date.today).order("end_date ASC").first
    if next_date.nil? || (next_date.start_date - Date.today).to_i > 15
      @help_status = "close"
    elsif next_date.end_date == Date.today || next_date.start_date == Date.today || next_date.start_date < Date.today && Date.today < next_date.end_date
      @help_status = "open"
    end
    @notation_helps = NotationHelp.new
  end
end
