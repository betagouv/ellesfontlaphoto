class CaseReviewsController < ApplicationController
  def create
    @case_review = CaseReview.new(case_review_params)
    @case_review.status = 'En attente de binôme'
    if @case_review.save
      if CaseReview.where(status: 'En attente de binôme').where.not(candidate_email: @case_review.candidate_email).empty?
        CaseReviewMailer.confirm(@case_review.candidate_email).deliver_later
      else
        @reviewer_case = CaseReview.where(status: 'En attente de binôme').where.not(candidate_email: @case_review.candidate_email).first
        if CaseReview.where(candidate_email: @case_review.candidate_email, reviewer_email: @reviewer_case.candidate_email).empty?
          @reviewer_case.update(reviewer_email: @case_review.candidate_email, status: 'En attente de revue', creation_binome: DateTime.now)
          @case_review.update(reviewer_email: @reviewer_case.candidate_email, status: 'En attente de revue', creation_binome: DateTime.now)
          CaseReviewMailer.send_case_review(@reviewer_case).deliver_later
          CaseReviewMailer.send_case_review(@case_review).deliver_later
        else
          CaseReviewMailer.confirm(@case_review.candidate_email).deliver_later
        end
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
    unless @case_review.date_envoi_feedback.nil?
      redirect_to revue_dossier_revue_path
    end
  end

  def review_case
    @case_review = CaseReview.find(params[:id])
    add_feedbacks(@case_review)
    if @case_review.valid?(:review_case)
      @case_review.update(status: 'Revue', date_envoi_feedback: DateTime.now)
      redirect_to revue_dossier_confirmation_path
    else
      render :edit
    end
  end

  private

  def add_feedbacks(case_review)
    case_review.update(case_review_params_edit)
    params[:case_review][:accept_partage_email] == "oui" ? case_review.update(accept_partage_email: true) : case_review.update(accept_partage_email: false)
    case_reviewer = CaseReview.where(candidate_email: case_review.reviewer_email, reviewer_email: case_review.candidate_email).first
    if case_reviewer.status == 'Revue'
      case_review.update(date_notation: DateTime.now)
      case_reviewer.update(date_notation: DateTime.now)
      CaseReviewMailer.send_feedback_form(case_review).deliver_later
      CaseReviewMailer.send_feedback_form(case_reviewer).deliver_later
    else
      CaseReviewMailer.send_attente_feedback(case_reviewer).deliver_later
    end
  end

  def case_review_params
    params.require(:case_review).permit(:message, :candidate_email, :case_attachment, :valid_cgu, :valid_conditions)
  end

  def case_review_params_edit
    params.require(:case_review).permit(:points_faibles, :points_forts, :review_comment, :autres, :lien_video)
  end
end
