class Account < ActiveRecord::Base
  attr_accessible :name, :oauth_token, :oauth_token_secret, :provider, :uid, :user_id

  validates :uid, :uniqueness => {:scope => :provider}
  
  def client 
    @client || @client = Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_token_secret) 
  end
  def favourites
    @favourites || client.favourites()
  end
end
