class Page < ActiveRecord::Base
  include PgSearch
  
  STATE_NEW      = 0
  STATE_DELETED  = 1
  STATE_READED   = 2

  attr_accessible :content, :media, :title, :tweet_id, :url, :state
  belongs_to :tweet
  has_one :account, :through => :tweet

  pg_search_scope :search_full_text, :against => {
      :title => 'A',
      :content => 'C'
    }
  
  scope :visibles, where(:state => [STATE_NEW])
  scope :next, lambda { |id, user_id| joins(:account).where("pages.id > ? and accounts.user_id = ?",id,user_id).order("id ASC") }
  scope :previous, lambda { |id, user_id| joins(:account).where("pages.id < ? and accounts.user_id = ?",id,user_id).order("id DESC") }

  def next
    #Page.next(id).first
    Page.visibles.next(id, account.user_id).first
  end

  def previous
    #Page.previous(id).first
    Page.visibles.previous(id, account.user_id).first
  end

  def readed?
    state == STATE_READED
  end
  
  def method_missing method_name
    if /^mark_as_(?<new_state>.*)/ =~ method_name
      new_state = Page.const_get("state_#{new_state}".upcase)
      self.update_attributes(:state => new_state) if new_state
    else
      super
    end
  end

end
