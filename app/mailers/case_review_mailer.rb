require 'open-uri'
class CaseReviewMailer < ApplicationMailer
  default from: 'Elles font la culture <ellesfontlaculture@beta.gouv.fr>'

  def confirm(candidate)
    @candidate = candidate
    mail(to: candidate, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - Inscription confirmée')
  end

  def relance_j13(case_review)
    @case_review = case_review
    mail(to: case_review.candidate_email, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - plus que 2 jours pour partager vos retours !')
  end

  def relance_j7(case_review)
    @case_review = case_review
    mail(to: case_review.candidate_email, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - plus que 7 jours pour partager vos retours !')
  end

  def send_case_review(case_review)
    @case_review = case_review
    @reviewer = case_review.reviewer_email
    case_attachment = URI.open(case_review.case_attachment.url)
    attachments['dossier.pdf'] = File.read(case_attachment)
    mail(to: @reviewer, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - À vous de jouer !')
  end

  def send_feedback_form(case_review)
    @case_review = case_review
    if case_review.review_comment.attached?
      attachment = URI.open(case_review.review_comment.url)
      attachments[case_review.review_comment.filename.to_s] = File.read(attachment)
    end
    mail(to: @case_review.candidate_email, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - découvrez les retours de votre binôme !')
  end

  def send_feedbacks(case_review)
    @case_review = case_review
    mail(to: case_review.candidate_email, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - donnez votre avis sur votre expérience !')
  end

  def send_suppression_compte(case_review)
    mail(to: case_review.reviewer_email, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - suppression de votre compte')
  end

  def send_attribution_nouveau_binome(case_review)
    mail(to: case_review.candidate_email, cc: ["revue-dossiers@beta.gouv.fr"], subject: "Revue de dossiers - Revue de dossiers - attribution d'un nouveau binôme")
  end

  def send_attente_feedback(case_review)
    @case_review = case_review
    @reviewer = case_review.reviewer_email
    case_attachment = URI.open(case_review.case_attachment.url)
    attachments['dossier.pdf'] = File.read(case_attachment)
    mail(to: @reviewer, cc: ["revue-dossiers@beta.gouv.fr"], subject: 'Revue de dossiers - votre binôme attend vos retours !')
  end
end
