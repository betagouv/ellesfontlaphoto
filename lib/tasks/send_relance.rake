namespace :send_relance do
  desc "Envoyer les relances"
  task relances: :environment do
    relancesj2 = CaseReview.where(status: "en attente de revue", creation_binome: Date.today - 13)
    relancesj2.each do |relance|
      CaseReviewMailer.relancej2(relance.candidate_email).deliver_later
    end

    relancesj7 = CaseReview.where(status: "en attente de revue", creation_binome: Date.today - 7)
    relancesj7.each do |relance|
      CaseReviewMailer.relancej7(relance.candidate_email).deliver_later
    end

    feedbacks = CaseReview.where.not(status: "revue non effectuée").where(date_notation: Date.today + 3)
    feedbacks.each do |feedback|
      CaseReviewMailer.send_feedbacks(feedback.candidate_email).deliver_later
    end

    archived = CaseReview.where(status: "en attente de revue", creation_binome: Date.today - 15)
    archived.each do |archive|
      archive.update(status: "revue non effectuée")
    end
  end
end
