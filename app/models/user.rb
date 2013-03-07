class User < ActiveRecord::Base
  attr_accessible :name, :avatar

  has_many  :accounts
  has_many  :tweets, :through => :accounts
  has_many  :pages, :through => :tweets
  has_one   :main_account, :class_name => 'Account', :conditions => { :main => true }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.name   = auth["info"]["name"]
      user.avatar = auth["info"]["image"]
    end
  end

  def create_account(auth)
    main = accounts.blank?
    accounts << Account.create! do |account|
      account.provider = auth["provider"]
      account.uid      = auth["uid"]
      account.name     = auth["info"]["name"]
      account.main     = main
    end
  end

  def favourites
    accounts.map {|account| account.favourites }.flatten
  end
end
