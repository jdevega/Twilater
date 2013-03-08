class UserController < ApplicationController

  def index
    @pages = current_user.pages if current_user
  end

  def look_for_new_tweets
    
    current_user.favourites
    render :nothing => true

  end

end