class TweetWorker
  include Sidekiq::Worker
  include Extract
  
  TWEETS_PER_REQUEST = 200
  
  def perform(account_id)
    account = Account.find(account_id)
    if account
		  	account.client.favourites(:count => TWEETS_PER_REQUEST).each do |tweet|
		    tweet_urls = {}
		    urls_from(tweet.text).each_with_index{ |url,index| tweet_urls[index] = url }
		    urls       = tweet_urls
		    account.tweets << Tweet.create!(:tweet_id => tweet.id.to_s, :created_at => tweet.created_at, :urls => urls)
		  end
   	end
  end
end