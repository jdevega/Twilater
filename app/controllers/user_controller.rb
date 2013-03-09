class UserController < ApplicationController

  def index
    @pages = current_user.pages if current_user
  end

  def search
    @pages = current_user.pages.search_full_text(params[:text].to_s)
    render :index
  end

  def look_for_new_tweets
    
    current_user.favourites
    render :nothing => true

  end

end