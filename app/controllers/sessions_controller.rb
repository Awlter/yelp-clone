class SessionsController < ApplicationController
  def create
    session_params = params.permit(:email, :password)
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in successfully!"
      redirect_to businesses_path
    else
      flash.now[:error] = "Sorry, something went wrong."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to businesses_path
  end
end