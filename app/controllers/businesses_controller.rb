class BusinessesController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    business = current_user.businesses.build(business_params)

    if business.save
      flash[:notice] = 'You have successfully created a business!'
      redirect_to root_path
    else
      flash.now[:error] = 'Something went wrong with your input information!'
      render :new
    end
  end

  def show
    @business = Business.find_by(slug: params[:id])
  end

  private

  def business_params
    params.require(:business).permit!
  end
end