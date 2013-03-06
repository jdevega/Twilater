class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :oauth_token, :oauth_token_secret

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def twitter_client ;	Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_token_secret) ; end
end
