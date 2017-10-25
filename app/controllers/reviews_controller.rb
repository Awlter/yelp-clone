class ReviewsController < ApplicationController
  before_action :require_user, only: [:create]

  def index
    @reviews = Review.includes(:user)
  end

  def create
    business = Business.find_by(id: params[:business_id])
    review = Review.new(review_params)
    review.user = current_user
    review.business = business

    review.save
    redirect_to business
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end