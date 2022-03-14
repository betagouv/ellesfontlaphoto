class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @help = Help.find(params[:help_id])
    @review.help = @help
    if @review.save
      redirect_to help_path(@help, anchor: "review-div")
    else
      @error_review = true
      redirect_to help_path(@help, anchor: "review-new"), alert: 'Une erreur est survenue. Pouvez vous recommencer'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
