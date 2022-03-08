class NotationConseilsVideosController < ApplicationController
  def create
    if NotationConseilsVideo::ANSWERS.include?(params[:answer])
     @conseil = ConseilsVideo.find(params[:conseil_id])
      @notation_conseil_video = NotationConseilsVideo.new(conseils_video: @conseil, comment: params[:comment])
      @notation_conseil_video.suggestion = params[:sugg].join(", ") if params[:sugg]
      @notation_conseil_video.comment = params[:comment] if params[:comment]
      if params[:answer] == "utile"
        @notation_conseil_video.utile = 1
      elsif params[:answer] == "inutile"
        @notation_conseil_video.inutile = 1
      end
      @notation_conseil_video.save
      respond_to do |format|
        format.html { redirect_to conseil_path(@conseil) }
        format.json
      end
    end
  end
end
