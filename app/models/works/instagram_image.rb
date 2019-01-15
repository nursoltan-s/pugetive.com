class InstagramImage < HostedImage
  attr_accessor :photo

  def initialize(photo)
    @photo = photo
  end

  def thumbnail(linked = true, options = {})
    if linked
      return link_to(img_tag(options), photo.canonical_path)
    end
    img_tag(options)
  end

  def large(linked = true, options = {})
    image_tag(instagram_url(photo.instagram_id), options)
  end

  def url
    instagram_url(photo.instagram_id)
  end

  private

    def img_tag(options = {})
      image_tag(instagram_url(photo.instagram_id, 't'), options)
    end

    def instagram_url(instagram_id, size = 'l')
      "https://instagram.com/p/#{instagram_id}/media/?size=#{size}"
    end

end
