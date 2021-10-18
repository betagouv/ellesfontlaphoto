class ConseilsVideosController < ApplicationController
  def show
    @conseil_video = ConseilsVideo.find(params[:id])
  end
end
