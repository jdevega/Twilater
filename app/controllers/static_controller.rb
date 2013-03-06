class StaticController < ApplicationController
	def index
		@favourites = current_twitter_client.favourites rescue nil
	end
end
