class NotificationHelpsController < ApplicationController
  def create
    @help = Help.find(params[:help_id])
    @notification_help = NotificationHelp.new(help: @help, email: params[:email])
    if @notification_help.save
      respond_to do |format|
        format.html { render redirect_to helps_path(@help) }
        format.text { render partial: 'notification_helps/done', formats: [:html] }
      end
    else
      if @notification_help.email == ""
        respond_to do |format|
          format.html { render redirect_to helps_path(@help) }
          format.text { render partial: 'notification_helps/notification_helps_modal', locals: { help: @help, error_save: true }, formats: [:html] }
        end
      else
        respond_to do |format|
          format.html { render redirect_to helps_path(@help) }
          format.text { render partial: 'notification_helps/failed', formats: [:html] }
        end
      end
    end
  end
end
