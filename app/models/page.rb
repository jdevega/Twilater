class Page < ActiveRecord::Base
  include PgSearch
  
  STATE_NEW      = 0
  STATE_DELETED  = 1
  STATE_SAVED    = 2

  attr_accessible :content, :media, :title, :tweet_id, :url, :state
  belongs_to :tweet

  pg_search_scope :search_full_text, :against => {
      :title => 'A',
      :content => 'C'
    }
  
  scope :visibles, where(:state => [STATE_NEW, STATE_SAVED]).order('created_at ASC')
  scope :next, lambda { |id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda { |id| where("id < ?",id).order("id DESC") }

  def next
    Page.next(id).first
  end

  def previous
    Page.previous(id).first
  end
end
