class ModelImage < HostedImage
  attr_accessor :work

  def initialize(work)
    @work = work
  end

  def thumbnail(linked = true, options = {})
   # <div class="screenshot">
   #   <a target="_blank" href="https://cdn.toddgehman.com/work/115/work-115.115.large.png?1511714957">
   #     <img class="thumbnail" src="https://cdn.toddgehman.com/work/115/work-115.115.thumb.png?1511714957" alt="Work 115.115.thumb">
   #    </a>
   #  </div>

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

# def thumbnail(link_to_original = false)
#   return nil unless model.has_image?
#   rv = ''
#   image_html = h.image_tag(model.image.url(:thumb), class: 'thumbnail')
#   if link_to_original
#     contents = h.link_to(image_html, model.image.url(:large), target: "_blank")
#   elsif model.url.present? and model.live?
#     contents = h.link_to(image_html, model.url)
#   else
#     contents = image_html
#   end
#   h.content_tag(:div, contents, class: 'screenshot')
# end

