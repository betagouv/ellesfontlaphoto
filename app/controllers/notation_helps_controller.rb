class NotationHelpsController < ApplicationController
  def create
    @help = Help.find(params[:help_id])
    @notation_help = NotationHelp.new(help: @help)
    @notation_help.suggestion = params[:sugg].join(", ") if params[:sugg]
    @notation_help.comment = params[:comment] if params[:comment]

    if params[:answer] == "yes"
      @notation_help.oui = 1
    end
    if params[:answer] == "no"
      @notation_help.non = 1
    end
    if params[:answer] == "yesbut"
      @notation_help.oui_mais_fermee = 1
    end
    @notation_help.save
    respond_to do |format|
      format.html { render redirect_to help_path(@help) }
      format.json
    end
  end
end
