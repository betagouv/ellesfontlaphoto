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

    to_reassigns = CaseReview.where(status: "En attente de revue", creation_binome: Date.today - 15)
    to_reassigns.each do |to_reassign|
      archived = CaseReview.where(candidate_email: to_reassign.reviewer_email, reviewer_email: to_reassign.candidate_email).first
      archived.update(status: 'Revue non effectuée')
      to_reassign.en_attente_de_binome
      CaseReviewMailer.send_suppression_compte(archived).deliver_now
      CaseReviewMailer.send_attribution_nouveau_binome(to_reassign).deliver_now
    end
  end
end
