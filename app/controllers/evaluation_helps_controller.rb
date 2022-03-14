class EvaluationHelpsController < ApplicationController
  def create
    @help = Help.find(params[:help_id])
    @evaluation_help = EvaluationHelp.new(evaluation_params)
    @evaluation_help.help = @help
    if @evaluation_help.save
    else
      @error = true
    end
    respond_to do |format|
      format.html { render redirect_to help_path(@help) }
      format.json
    end
  end

  def evaluation_params
    params.require(:evaluation_help).permit(:eval_dossier, :eval_dispositif)
  end
end
