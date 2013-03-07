require 'open-uri'
class Tweet < ActiveRecord::Base

  attr_accessible :created_at, :tweet_id, :urls
  serialize :urls, ActiveRecord::Coders::Hstore

  has_many :pages
  belongs_to :account

  after_create :create_pages

  def create_pages
  	urls.each_value do |url|
  		PageWorker.perform_async(url, self.id) 		
  	end
  end
end
