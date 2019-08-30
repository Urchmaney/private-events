
class SessionsController < ApplicationController
  before_action :prevent_access_login, only: %i[new create]
  def new; end

  def create
    @user = User.find_by(username: params[:session][:name])
    if @user
      login @user
      redirect_to user_path @user
    else
      flash[:error] = 'User name is wrong!'
      redirect_to login_path
    end
  end

  

  def destroy
    logout
    redirect_to login_path
  end

  private

  def prevent_access_login
    redirect_to root_path if logged_in?
  end
end