class ContactMailer < ApplicationMailer
  default from: "Elles font la culture <ellesfontlaculture@beta.gouv.fr>"

  def new_contact(contact)
    @contact = contact
    mail_to_send = ["ellesfontlaculture@beta.gouv.fr", "nadia.auger@beta.gouv.fr","lauriane.fort@beta.gouv.fr","sarah.witt@beta.gouv.fr"]
    mail(to: mail_to_send, subject: "[ellesfontlaculture.beta.gouv.fr] NOUVEAU CONTACT !")
  end
end
