class StaticController < ApplicationController
	def index
		@favourites = current_user.favourites if current_user
	end
end
