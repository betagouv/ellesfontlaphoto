# namespace :case_reviews do
#   namespace :relances do
#     relancesj2 = CaseReview.where(status: "en attente de revue", creation_binome: Date.today - 13)
#     relancesj2.each do |relance|
#       CaseReviewMailer.relancej2(relance.candidate_email).deliver_now
#     end

#     relancesj7 = CaseReview.where(status: "en attente de revue", creation_binome: Date.today - 7)
#     relancesj7.each do |relance|
#       CaseReviewMailer.relancej7(relance.candidate_email).deliver_now
#     end
#   end
#   namespace :feedbacks do
#     feedbacks = CaseReview.where(date_notation: Date.today + 3)
#     feedbacks.each do |feedback|
#       CaseReviewMailer.send_feedbacks(feedback.candidate_email).deliver_now
#     end
#   end
# end
