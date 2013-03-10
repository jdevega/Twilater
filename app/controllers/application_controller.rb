class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_accounts
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_accounts
  	current_user.accounts if current_user
  end

  def user_must_be_logged
    redirect_to root_url, :alert => "User must be logged!" unless current_user 
  end
end
