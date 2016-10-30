module LinksHelper

  def touch_path(subject)
    "/touch/#{subject.class.name.downcase}/#{subject.id}"
  end

  def flickr_link(flickr_id)
    link_to(raw("Flickr #{flickr_icon}"), "https://www.flickr.com/photos/pugetive/#{flickr_id}/")
  end

  def instagram_link(instagram_id)
    link_to(raw("Instagram #{instagram_icon}"), "https://www.instagram.com/p/#{instagram_id}")
  end
end