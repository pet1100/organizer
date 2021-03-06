class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_url, notice: :logged_out_notice
  end
end
