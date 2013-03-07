class Account < ActiveRecord::Base
  

  attr_accessible :name, :oauth_token, :oauth_token_secret, :provider, :uid, :user_id

  validates :uid, :uniqueness => {:scope => :provider}

  has_many :tweets 

  def client 
    @client || @client = Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_token_secret) 
  end
  def favourites
    harvest
  end

  def last_tweet_id
    tweets.order('created_at DESC').first.tweet_id rescue "1"
  end
end