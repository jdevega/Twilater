class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_twitter_client
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_twitter_client
  	current_user.twitter_client if current_user
  end
end
