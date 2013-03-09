class PageWorker
  include Sidekiq::Worker

  def perform(url, tweet_id)
    page = open(url).read rescue nil
    if page 
      doc = Readability::Document.new(page,:tags => %w[div p a img ul li], :attributes => %w[src href])
      
      Page.create!( :title    => doc.title , 
                    :url      => url, 
                    :media    => (doc.images.first rescue nil),
                    :content  =>  doc.content, 
                    :tweet_id => tweet_id)
    end
  end
end