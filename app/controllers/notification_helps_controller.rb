class NotificationHelpsController < ApplicationController
  def create
    @notification_help = NotificationHelp.new(help: Help.find(params[:help_id]), email: params[:email])
    if @notification_help.save
      respond_to do |format|
        format.html { render redirect_to helps_path(@help) }
        format.text { render partial: 'notification_helps/done', locals: { movies: @movies }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render redirect_to helps_path(@help) }
        format.text { render partial: 'notification_helps/failed', locals: { movies: @movies }, formats: [:html] }
      end
    end
  end
end
