class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) #if the user exists AND entered password is correct
      flash[:notice] = "You are now logged in."
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = "We could not log you in.  Please try again..."
      redirect_to '/login' #if user login doesn't work, send them back to Login form
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out successfully."
    redirect_to '/login'
  end


end
