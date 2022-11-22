require 'open-uri'
class CaseReviewMailer < ApplicationMailer
  default from: "Elles font la culture <ellesfontlaculture@beta.gouv.fr>"

  def confirm(candidate)
    @candidate = candidate
    mail(to: candidate, subject: "Confirmation reception de dossier")
  end

  def relance_j7(reviewer)
    @reviewer = reviewer
    mail(to: reviewer, subject: "Relance revue de dossier")
  end

  def send_case_review(case_review)
    @case_review = case_review
    @reviewer = case_review.reviewer_email
    case_attachment = URI.open(case_review.case_attachment.url)
    attachments['dossier.pdf'] = File.read(case_attachment)
    mail(to: @reviewer, subject: "Le dossier de votre binôme est là !")
  end

  def send_feedback_form(reviewer)
    @reviewer = reviewer
    mail(to: reviewer, subject: "Questionnaire de feedbacks")
  end

  def send_feedbacks(candidate)
    @candidate = candidate
    mail(to: candidate, subject: "Les retours de votre binôme sont là !")
  end

  def thank_you(candidate)
    @candidate = candidate
    mail(to: candidate, subject: "Merci !")
  end
end
