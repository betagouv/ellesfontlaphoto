class CaseReviewsController < ApplicationController

  def new
    @case_review = CaseReview.new()
  end

  def create
    @case_review = CaseReview.new(case_review_params)
    @case_review.status = "En attente de binôme"
    if @case_review.save
      if CaseReview.where(status: "En attente de binôme").where.not(candidate_email: @case_review.candidate_email).empty?
        CaseReviewMailer.confirm(@case_review.candidate_email).deliver_now
      else
        @reviewer_case = CaseReview.where(status: "En attente de binôme").where.not(candidate_email: @case_review.candidate_email).first
        @reviewer_case.update(reviewer_email: @case_review.candidate_email, status: "en attente de revue", creation_binome: Date.today)
        @case_review.update(reviewer_email: @reviewer_case.candidate_email, status: "en attente de revue", creation_binome: Date.today)
        CaseReviewMailer.send_case_review(@reviewer_case).deliver_now
        CaseReviewMailer.send_case_review(@case_review).deliver_now
      end
      redirect_to case_reviews_confirmation
    else
      render :new
    end
  end

  def edit
    @case_review = CaseReview.find(params[:id])
  end

  def update
    @case_review = CaseReview.find(params[:id])
    @case_review.update(case_review_params_edit)
    @case_review.update(status: "Revue")
    @case_reviewer = CaseReview.where(reviewer_email: @case_review.candidate_email).first
    if @case_reviewer.status == "Revue"
      @case_review.update(date_notation: Date.today)
      @case_reviewer.update(date_notation: Date.today)
      CaseReviewMailer.send_feedback_form(@case_review).deliver_now
      CaseReviewMailer.send_feedback_form(@case_reviewer).deliver_now
    end
    redirect_to case_reviews_confirmation
  end

  def case_review_params
    params.require(:case_review).permit(:candidate_email, :case_attachment)
  end

  def case_review_params_edit
    params.require(:case_review).permit(:points_faibles, :points_forts, :review_comment, :autres, :lien_video)
  end
end
