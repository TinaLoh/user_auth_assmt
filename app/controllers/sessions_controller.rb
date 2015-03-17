class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) #if the user exists AND entered password is correct
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login' #if user login doesn't work, send them back to Login form
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end


end
