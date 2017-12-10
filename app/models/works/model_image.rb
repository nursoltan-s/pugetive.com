class ModelImage < HostedImage
  attr_accessor :work

  def initialize(work)
    @work = work
  end

  def thumbnail(linked = true, options = {})
    if linked
      return link_to(img_tag(options.merge(class: 'thumbnail')), work.image.url(:large), {target: "_blank"})
    end

    img_tag(options.merge(class: 'thumbnail'))
  end

  def large(linked = true, options = {})
    # image_tag(instagram_url(photo.instagram_id), options)
  end

  private

    def img_tag(options = {})
      image_tag(work.image.url(:thumb), options)
    end

end
