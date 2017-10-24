class ReviewsController < ApplicationController
  before_action :require_user

  def index
    @reviews = Review.all
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
    params.require(:review).permit!
  end
end