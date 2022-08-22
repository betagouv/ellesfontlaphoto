class HelpsController < ApplicationController
  def index
    @helps = Help.all.where(visible: true)
    @selected = false
    @total_count = @helps.count
    if params[:residence].present?
      @selected = true
      if params[:residence] == "Outre-mer"
        @helps = Help.where(residence_condition: ["Guadeloupe", "Guyane", "Martinique", "Mayotte", "Réunion", "Française résidant en outre-mer", "Française ou résidant en France", ""])
      elsif params[:residence] == "Guadeloupe" || params[:residence] == "Guyane" || params[:residence] == "Martinique" || params[:residence] == "Mayotte" || params[:residence] == "Réunion"
        @helps = Help.where(residence_condition: [params[:residence], "Française résidant en outre-mer", "Française ou résidant en France", ""])
      elsif params[:residence] == "À l'étranger"
        @helps = Help.where(residence_condition: ["Française résidant à l'étranger", "Française ou résidant en France", ""])
      elsif params[:residence] == "France"
        @helps = Help.where.not(residence_condition: ["Française résidant à l'étranger"])
      else
        @helps = Help.where(residence_condition: [params[:residence], "Française ou résidant en France", ""])
      end
    end
    if params[:type_list].present? && params[:type_list].split(",").length != 0
      @selected = true
      @selected_type = params[:type_list]
      params[:type_list] = params[:type_list].split(",").map { |x| x == "exposition festival" ? "exposition & festival" : x }
      @helps = @helps.tagged_with(params[:type_list], :any => true)
    end
    if params[:open].present? && params[:open] == "true"
      @selected = true
      @helps = @helps.where(open: true)
    end
    if params[:parite].present? && params[:parite] == "true"
      @selected = true
      @helps = @helps.where(old_laureats_parite: "respectée").or(@helps.where(commission_parite: "respectée"))
    end
    @helps = @helps.order(:end_date)
    if params[:type_photo_list].present?
      @selected_photo_type = true
      @helps = @helps.tagged_with(params[:type_photo_list].split(","), :any => true) | @helps.tagged_with(Help::PHOTO_TYPE.excluding(params[:type_photo_list].split(",")), :exclude => true)
    end
    @helps_count = @helps.count

    respond_to do |format|
      format.html
      format.text { render partial: 'main_index_helps', locals: { helps: @helps }, formats: [:html] }
    end
  end

  def show
    @help = Help.find(params[:id])
    @review = Review.new
    @reviews = @help.reviews
    @evaluation_help = EvaluationHelp.new
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

  def new
    @help = Help.new
    @help.candidature_dates.build
  end

  def create
    @help = Help.new(params.require(:help).permit(:permanent))
    if @help.permanent?
      @help = Help.new(help_params_permanent)
    else
      @help = Help.new(help_params)
    end
    @help.type_list = params["help"]["type_list"]
    @help.type_photo_list = params["help"]["type_photo_list"]
    if @help.save
      redirect_to helps_confirm_path
    else
      @help.candidature_dates.build unless @help.permanent?
      render :new
    end
  end

  def confirm
  end

  private

  def help_params
    params.require(:help).permit(:visible, :title, :description, :type, :type_photo, :institution_name, :institution_url, :contact_intitution_email, :permanent, :help_amount, :residence_condition, :general_condition, :specific_condition, :residence_time, :admin_attachment, :admin_attachment, :artistic_attachment, :candidate_url, :selection, :parentality, :accessibility, :author_email, :suggested, :candidature_dates_attributes => [:start_date, :end_date]) do |help_param|
      help_param.require(:author_email)
    end
  end

  def help_params_permanent
    params.require(:help).permit(:visible, :title, :description, :type, :type_photo, :institution_name, :institution_url, :contact_intitution_email, :permanent, :help_amount, :residence_condition, :general_condition, :specific_condition, :residence_time, :admin_attachment, :admin_attachment, :artistic_attachment, :candidate_url, :selection, :parentality, :accessibility, :author_email, :suggested) do |help_param|
      help_param.require(:author_email)
    end
  end
end
