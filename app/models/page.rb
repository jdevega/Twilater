class Page < ActiveRecord::Base
  attr_accessible :content, :media, :title, :tweet_id, :url

  belongs_to :tweet
end
