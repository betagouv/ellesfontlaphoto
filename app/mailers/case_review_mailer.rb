require 'open-uri'
class CaseReviewMailer < ApplicationMailer
  default from: "Elles font la culture <ellesfontlaculture@beta.gouv.fr>"

  def confirm(candidate)
    @candidate = candidate
    mail(to: candidate, subject: "Revue de dossiers - Inscription confirmée")
  end

  def relance_j2(case_review)
    @case_review = case_review
    mail(to: case_review.candidate_email, subject: "Revue de dossiers - plus que 2 jours pour partager vos retours !")
  end

  def relance_j7(case_review)
    @case_review = case_review
    mail(to: case_review.candidate_email, subject: "Revue de dossiers - votre binôme attend votre retour !")
  end

  def send_case_review(case_review)
    @case_review = case_review
    @reviewer = case_review.reviewer_email
    case_attachment = URI.open(case_review.case_attachment.url)
    attachments['dossier.pdf'] = File.read(case_attachment)
    mail(to: @reviewer, subject: "Revue de dossiers - A vous de jouer !")
  end

  def send_feedback_form(case_review)
    @case_review = case_review
    mail(to: @case_review.candidate_email, subject: "Revue de dossiers - découvrez les retours de votre binôme !")
  end

  def send_feedbacks(case_review)
    @case_review = case_review
    mail(to: case_review.candidate_email, subject: "Revue de dossiers - donnez votre avis sur votre expérience !")
  end
end