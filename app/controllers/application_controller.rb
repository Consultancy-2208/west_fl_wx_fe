class ApplicationController < ActionController::Base
  before_action :check_login
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.current_user_by_with_conditional(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def check_login
    return if logged_in?

    flash[:error] = 'You must be logged in to view this content'
    redirect_to root_path
  end
end
