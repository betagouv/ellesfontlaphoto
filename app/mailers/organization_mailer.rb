class OrganizationMailer < ApplicationMailer
  default from: 'Elles font la culture <ellesfontlaculture@beta.gouv.fr>'

  def new_chiffres(chiffres)
    @chiffres = chiffres
    mail_to_send = ["ellesfontlaculture@beta.gouv.fr", "nadia.auger@beta.gouv.fr","lauriane.fort@beta.gouv.fr","sarah.witt@beta.gouv.fr"]
    mail(to: mail_to_send, subject: "[ellesfontlaculture.beta.gouv.fr] DES NOUVEAUX CHIFFRES !")
  end
end
