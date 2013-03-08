class Page < ActiveRecord::Base
	STATE_NEW 		= 0
	STATE_DELETED = 1
	STATE_SAVED		= 2

  attr_accessible :content, :media, :title, :tweet_id, :url, :state

  scope :visible, where(:state => [STATE_NEW, STATE_SAVED]).order('created_at DESC')

  belongs_to :tweet
end
