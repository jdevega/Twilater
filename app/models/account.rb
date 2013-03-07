class Account < ActiveRecord::Base
  include Extract
  TWEETS_PER_REQUEST = 200

  attr_accessible :name, :oauth_token, :oauth_token_secret, :provider, :uid, :user_id

  validates :uid, :uniqueness => {:scope => :provider}

  has_many :tweets 

  def client 
    @client || @client = Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_token_secret) 
  end
  def favourites
    harvest
  end

  #private

  def last_tweet_id
    tweets.order('created_at DESC').first.tweet_id rescue "1"
  end

  def harvest
    client.favourites(:since_id => last_tweet_id ,:count => TWEETS_PER_REQUEST).each do |tweet|
      tweet_urls = {}
      urls_from(tweet.text).each_with_index{|url,index| tweet_urls[index] = url}
      urls       = tweet_urls
      tweets << Tweet.create!(:tweet_id => tweet.id.to_s, :created_at => tweet.created_at, :urls => urls)
    end
  end
end
