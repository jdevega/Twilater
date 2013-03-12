class UserController < ApplicationController

  def look_for_new_tweets
    current_user.favourites
    render :nothing => true
  end

  def look_for_new_pages
    pages = current_user.new_pages
    render :json => {:pages => pages }
  end

end