class HelpMailer < ApplicationMailer
  default from: "Elles font la culture <ellesfontlaculture@beta.gouv.fr>"

  def new_help(help)
    @help = help
    mail_to_send = ["ellesfontlaculture@beta.gouv.fr", "nadia.auger@beta.gouv.fr","lauriane.fort@beta.gouv.fr","sarah.witt@beta.gouv.fr"]
    mail(to: mail_to_send, subject: "[ellesfontlaculture.beta.gouv.fr] UNE NOUVELLE AIDE !")
  end

  def online_help(help)
    @help = help
    mail_to_send = @help.author_email
    # mail_to_send = ["ellesfontlaculture@beta.gouv.fr", "nadia.auger@beta.gouv.fr","lauriane.fort@beta.gouv.fr","sarah.witt@beta.gouv.fr"]
    mail(to: mail_to_send, subject: "[ellesfontlaculture.beta.gouv.fr] Aide publiée")
  end


  def send_notification(help_notification)
    @help_notification = help_notification
    mail_to_send = help_notification.email
    mail(to: mail_to_send, subject: "[ellesfontlaculture.beta.gouv.fr] Aide ouverte")
  end
end
