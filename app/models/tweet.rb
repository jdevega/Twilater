class Tweet < ActiveRecord::Base

  attr_accessible :created_at, :tweet_id, :urls
  serialize :urls, ActiveRecord::Coders::Hstore

  has_many :pages
  belongs_to :account
end
