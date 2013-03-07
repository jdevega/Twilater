class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    user.update_attributes({oauth_token: auth.credentials.token, oauth_token_secret: auth.credentials.secret})
    session[:user_id] = user.id

    #TODO: Una vez el usuario se ha validado hay que recuperar sus tweets nuevos.

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end