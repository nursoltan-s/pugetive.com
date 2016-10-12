module ImageHelper

  def thumbnail(work)
    if work.instagram_id.present?
      return image_tag(instagram_url(work.instagram_id, 't'))
    end
  end

  def instagram_thumbnail(instagram_id)
    image_tag(instagram_url(instagram_id, 't'))
  end

  private
    def instagram_url(instagram_id, size = 'l')
      "https://instagram.com/p/#{instagram_id}/media/?size=#{size}"
    end
end