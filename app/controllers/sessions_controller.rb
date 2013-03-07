class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    account = Account.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth).create_account(auth).detect{|account| account.main}
    account.update_attributes({oauth_token: auth.credentials.token, oauth_token_secret: auth.credentials.secret})
    session[:user_id] = account.user_id
    session[:account_id] = account.id

    #TODO: Una vez el usuario se ha validado hay que recuperar sus tweets nuevos para cada cuenta.

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end