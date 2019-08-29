class SessionsController < ApplicationController
  def new
      @user= User.new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)    
    if @user != nil
      redirect_to users_paths
    else
      render :new
    end
  end
end
