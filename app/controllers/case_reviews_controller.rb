class CaseReviewsController < ApplicationController

  def new
    @case_review = CaseReview.new()
  end

  def create
    @case_review = CaseReview.new(case_review_params)
    @case_review.save
    redirect_to root_path
  end


  def case_review_params
    params.require(:case_review).permit(:candidate_email, :case)
  end
end
