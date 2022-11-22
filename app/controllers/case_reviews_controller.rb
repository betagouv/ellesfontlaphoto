class CaseReviewsController < ApplicationController

  def new
    @case_review = CaseReview.new()
    CaseReviewMailer.send_case_review(CaseReview.first).deliver_now
  end

  def create
    @case_review = CaseReview.new(case_review_params)
    @case_review.status = "En attente de binôme"
    if @case_review.save
      if CaseReview.where(status: "En attente de binôme").where.not(candidate_email: @case_review.candidate_email).empty?
        CaseReviewMailer.confirm(@case_review.candidate_email).deliver_now
      else
        @reviewer_case = CaseReview.where(status: "En attente de binôme").where.not(candidate_email: @case_review.candidate_email).first
        @reviewer_case.update(reviewer_email: @case_review.candidate_email, status: "en attente de revue")
        @case_review.update(reviewer_email: @reviewer_case.candidate_email, status: "en attente de revue")
        CaseReviewMailer.send_case_review(@reviewer_case).deliver_now
        CaseReviewMailer.send_case_review(@case_review).deliver_now
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @case_review = CaseReview.find(params[:id])
  end

  def update
  end

  def case_review_params
    params.require(:case_review).permit(:candidate_email, :case_attachment)
  end

  def case_review_params_edit
    params.require(:case_review).permit(:points_faibles, :points_forts, :review_comment, :autres)
  end
end
