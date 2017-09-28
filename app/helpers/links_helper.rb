module LinksHelper

  def touch_path(subject)
    "/touch/#{subject.class.name.downcase}/#{subject.id}"
  end

  def photo_link(work, content = "Photo")
    if work.flickr_id.present?
      return flickr_link(work.flickr_id, content)
    elsif work.instagram_id.present?
      return instagram_link(work.instagram_id, content)
    end
  end

  def flickr_link(flickr_id, content = "Flickr #{flickr_icon}")
    link_to(raw(content), "https://www.flickr.com/photos/pugetive/#{flickr_id}/", title: "View photograph on Flickr", target: "_blank")
  end

  def instagram_link(instagram_id, content = "Instagram #{instagram_icon}")
    link_to(raw(content), "https://www.instagram.com/p/#{instagram_id}", title: "View photograph on Instagram", target: "_blank")
  end


end