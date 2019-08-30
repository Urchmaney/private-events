# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show index]

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      redirect_to user_path @user
    else
      render :new
    end
  end

  def show
    @events = current_user.events
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
