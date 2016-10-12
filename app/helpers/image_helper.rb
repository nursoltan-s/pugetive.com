module ImageHelper
  FlickRaw.api_key= CONFIG[Rails.env][:flickr_api_key]
  FlickRaw.shared_secret=CONFIG[Rails.env][:flickr_secret]

  def thumbnail(work)
    if work.instagram_id.present?
      return instagram_thumbnail(work.instagram_id)
    elsif work.flickr_id.present?
      return flickr_thumbnail(work.flickr_id)
    end
  end

  def instagram_thumbnail(instagram_id)
    image_tag(instagram_url(instagram_id, 't'))
  end

  def flickr_thumbnail(flickr_id)
    info = flickr.photos.getInfo(photo_id: flickr_id)
    image_tag(FlickRaw.url_q(info))
  end

  private
    def instagram_url(instagram_id, size = 'l')
      "https://instagram.com/p/#{instagram_id}/media/?size=#{size}"
    end
end