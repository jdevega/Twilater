class PageWorker
  include Sidekiq::Worker

  def perform(url, tweet_id)
    page = Nokogiri::HTML(open(url)) rescue nil
		if page 
			title 	=	page.search('title').inner_text
			content = page.search('body').inner_text
			media		= nil
			# Crear objeto Page vinculado al tweet si el resultado es correcto
			Page.create!(:title => title , :url => url, :media => media, :content =>  content, :tweet_id => tweet_id)
		end
  end
end