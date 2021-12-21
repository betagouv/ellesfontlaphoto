class NotationConseilsVideosController < ApplicationController
  def create
    @conseil = ConseilsVideo.find(params[:conseil_id])
    @notation_conseil_video = NotationConseilsVideo.find_by(conseils_video: @conseil)
    if params[:answer] == "utile"
      unless @notation_conseil_video
        @notation_conseil_video = NotationConseilsVideo.new(conseils_video: @conseil)
      end
      @notation_conseil_video.utile += 1
    end
    if params[:answer] == "inutile"
      unless @notation_conseil_video
        @notation_conseil_video = NotationConseilsVideo.new(conseils_video: @conseil)
      end
      @notation_conseil_video.inutile += 1
    end
    @notation_conseil_video.save
    respond_to do |format|
      format.html { render 'conseils_pratiques/index' }
      format.json
    end
  end
end
