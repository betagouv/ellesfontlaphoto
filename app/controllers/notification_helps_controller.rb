class NotificationHelpsController < ApplicationController
  def create
    @help = Help.find(params[:notification_help][:help_id])
    @notification_help = NotificationHelp.new(notification_help_params)
    unless @notification_help.email == "foo-bar@example.com"
      if @notification_help.save
        respond_to do |format|
          format.html { render redirect_to helps_path(@help) }
          format.text { render partial: 'notification_helps/done', formats: [:html] }
        end
      else
        unless NotificationHelp.where(help: @help, email: params[:notification_help][:email]).empty?
          respond_to do |format|
            format.html { render redirect_to helps_path(@help) }
            format.text { render partial: 'notification_helps/failed', formats: [:html] }
          end
        else
          respond_to do |format|
            format.html { render redirect_to helps_path(@help) }
            format.text { render partial: 'notification_helps/notification_helps_modal', locals: { help: @help, error_save: true }, formats: [:html] }
          end
        end
      end
    end
  end

  private
  def notification_help_params
    params.require(:notification_help).permit(:email, :accept_cgu, :help_id)
  end
end
