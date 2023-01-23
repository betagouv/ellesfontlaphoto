namespace :send_relance do
  desc "Envoyer les relances"
  task relances: :environment do
    relancesj13 = CaseReview.where(status: "En attente de revue", creation_binome: Date.today - 13)
    relancesj13.each do |relance|
      CaseReviewMailer.relance_j13(relance).deliver_now
    end

    relancesj7 = CaseReview.where(status: "En attente de revue", creation_binome: Date.today - 7)
    relancesj7.each do |relance|
      CaseReviewMailer.relance_j7(relance).deliver_now
    end

    feedbacks = CaseReview.where.not(status: "Revue non effectuée").where(date_notation: Date.today + 3)
    feedbacks.each do |feedback|
      CaseReviewMailer.send_feedbacks(feedback).deliver_now
    end

    archived = CaseReview.where(status: "En attente de revue", creation_binome: Date.today - 15)
    archived.each do |archive|
      deleted = CaseReview.where(candidate_email: archive.reviewer_email, reviewer_email: case_review.candidate_email)
      deleted.update(status: 'Revue non effectuée')
      archive.update(status: 'En attente de binôme', creation_binome: nil)
      CaseReviewMailer.send_suppression_compte(deleted).deliver_now
      CaseReviewMailer.send_attribution_nouveau_binome(archive).deliver_now
    end
  end
end
