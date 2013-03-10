module PageHelper

	def link_to_page page
		link_to page.url, page.url
	end

  def link_to_previous_page_for page
    link_to "Previous", previous_page_for_path(page) if page and page.previous
  end

  def link_to_next_page_for page
    link_to "Next", next_page_for_path(page) if page and page.next
  end

end