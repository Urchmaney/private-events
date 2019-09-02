# frozen_string_literal: true

module SessionsHelper
  def login(user)
    session[:id] = user.id
  end

  def current_user
    return unless (user_id = session[:id])

    @current_user ||= User.find_by(id: user_id)
  end

  def logout
    session.delete(:id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_path
  end
end
