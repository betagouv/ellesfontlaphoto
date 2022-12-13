class CaseReviewsController < ApplicationController
  def create
    @case_review = CaseReview.new(case_review_params)
    @case_review.status = 'En attente de binôme'
    if @case_review.save
      if CaseReview.where(status: 'En attente de binôme').where.not(candidate_email: @case_review.candidate_email).empty?
        CaseReviewMailer.confirm(@case_review.candidate_email).deliver_now
      else
        @reviewer_case = CaseReview.where(status: 'En attente de binôme').where.not(candidate_email: @case_review.candidate_email).first
        @reviewer_case.update(reviewer_email: @case_review.candidate_email, status: 'En attente de revue', creation_binome: Date.today)
        @case_review.update(reviewer_email: @reviewer_case.candidate_email, status: 'En attente de revue', creation_binome: Date.today)
        CaseReviewMailer.send_case_review(@reviewer_case).deliver_now
        CaseReviewMailer.send_case_review(@case_review).deliver_now
      end
      respond_to do |format|
        format.html { render redirect_to case_reviews_confirmation_path }
        format.text { render partial: 'case_reviews/validation', formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.text { render partial: 'form', formats: [:html] }
      end
    end
  end

  def edit
    @case_review = CaseReview.find(params[:id])
    # unless @case_review.date_envoi_feedback.nil?
    #   redirect_to revue_dossier_revue_path
    # end
  end

  def update
    @case_review = CaseReview.find(params[:id])
    add_feedbacks(@case_review)
    if @case_review.valid?
      redirect_to revue_dossier_confirmation_path
    else
      render :edit
    end
  end

  private

  def add_feedbacks(case_review)
    case_review.update(case_review_params_edit)
    case_review.update(status: 'Revue', date_envoi_feedback: Date.today)
    case_reviewer = CaseReview.where(reviewer_email: case_review.candidate_email).first
    if case_reviewer.status == 'Revue'
      case_review.update(date_notation: Date.today)
      case_reviewer.update(date_notation: Date.today)
      CaseReviewMailer.send_feedback_form(case_review).deliver_now
      CaseReviewMailer.send_feedback_form(case_reviewer).deliver_now
    end
  end

  def case_review_params
    params.require(:case_review).permit(:message, :candidate_email, :case_attachment, :engagement)
  end

  def case_review_params_edit
    params.require(:case_review).permit(:points_faibles, :points_forts, :review_comment, :autres, :lien_video)
  end
end
