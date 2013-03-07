require 'uri'
module Extract

  def urls_from(text)
    URI.extract(text)
  end

end