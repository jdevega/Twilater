class PageWorker
  include Sidekiq::Worker

  def perform(url, tweet_id)
    page = open(url).read rescue nil
		if page 
			content 	= Readability::Document.new(page).content
			page 			= Nokogiri::HTML(page)
			title 		=	page.search('title').inner_text
			media			= nil
			Page.create!(:title => title , :url => url, :media => media, :content =>  content, :tweet_id => tweet_id)
		end
  end
end