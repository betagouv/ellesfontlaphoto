class EvaluationHelpsController < ApplicationController
  def create
    @help = Help.find(params[:help_id])
    @evaluation_help = EvaluationHelp.new(evaluation_params)
    # if (EvaluationHelp::NOTES.include?(@evaluation_help.eval_dossier) && @evaluation_help.eval_dispositif == nil) || (EvaluationHelp::NOTES.include?(@evaluation_help.eval_dispositif) && @evaluation_help.eval_dossier == nil)
      @evaluation_help.help = @help
      if @evaluation_help.save
      else
        @error = true
      end
    # end
    respond_to do |format|
      format.html { redirect_to help_path(@help) }
      format.json
    end
  end

  def index
    @help = Help.find(params[:help_id])
    @dossier_grades_count = @help.evaluation_helps.where.not(eval_dossier: nil).count
    @dossier_grade = @dossier_grades_count == 0 ? nil : (@help.evaluation_helps.sum(:eval_dossier) / @dossier_grades_count.to_f).round()
    @dispositif_grades_count = @help.evaluation_helps.where.not(eval_dispositif: nil).count
    @dispositif_grade = @dispositif_grades_count == 0 ? nil : (@help.evaluation_helps.sum(:eval_dispositif) / @dispositif_grades_count.to_f).round()
    respond_to do |format|
      format.html { redirect_to help_path(@help) }
      format.text { render partial: 'evaluation_helps/index', locals: { reviews: @reviews, dossier_grade: @dossier_grade, dispositif_grade: @dispositif_grade }, formats: [:html] }
    end
  end

  def evaluation_params
    params.require(:evaluation_help).permit(:eval_dossier, :eval_dispositif)
  end
end
