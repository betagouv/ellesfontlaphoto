class NotationHelpsController < ApplicationController
  def create
    @help = Help.find(params[:help_id])
    @notation_help = NotationHelp.find_by(help: @help)
    if params[:answer] == "yes"
      unless @notation_help
        @notation_help = NotationHelp.new(help: @help)
      end
      @notation_help.oui += 1
    end
    if params[:answer] == "no"
      unless @notation_help
        @notation_help = NotationHelp.new(help: @help)
      end
      @notation_help.non += 1
    end
    if params[:answer] == "yesbut"
      unless @notation_help
        @notation_help = NotationHelp.new(help: @help)
      end
      @notation_help.oui_mais_fermee += 1
    end
    @notation_help.save
    @voted = true
  end
end
