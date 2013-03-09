module PageHelper

	def link_to_page page
		link_to page.url, page.url
	end

end