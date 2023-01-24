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
      reassign = CaseReview.where(candidate_email: archive.reviewer_email, reviewer_email: archive.candidate_email).first
      archive.update(status: 'Revue non effectuée')
      reassign.en_attente_de_binome
      CaseReviewMailer.send_suppression_compte(archive).deliver_now
      CaseReviewMailer.send_attribution_nouveau_binome(reassign).deliver_now
    end
  end
end
