class UsersController < ApplicationController
  def show 

  end

  def new 
    @user = User.new
  end

  def create
    @user=User.new(user_param)
    if @user.save
        redirect_to 
    else
        render :new
    end
  end

  private

  def user_param
      params.require(:user).permit(:username,:email)
  end
end
