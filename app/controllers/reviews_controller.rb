class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @help = Help.find(params[:help_id])
    @review.help = @help
    if @review.save
      redirect_to help_path(@help), anchor: "#review-div"
    else
      redirect_to help_path(@help), anchor: "#review-div"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
