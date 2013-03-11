module PageHelper

	def link_to_page page, options = {}
		link_to page.url, page.url, options
	end

  def link_to_previous_page_for page, options = {}
    link_to "Previous", page_path(page.previous), options if page and page.previous
  end

  def link_to_next_page_for page, options = {}
    link_to "Next", page_path(page.next), options if page and page.next
  end

end