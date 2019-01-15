class HostedImage
  attr_accessor :image

  def initialize(work)
    if work.instagram_id.present?
      @image = InstagramImage.new(work)
    elsif work.flickr_id.present?
      @image = FlickrImage.new(work)
    elsif work.has_image?
      @image = ModelImage.new(work)
    else
      raise PugetiveError, "Attempted to instantiate a HostedImage with no 3rd party information " +
                           "associated with the Work passed in."
    end
  end

  def thumbnail(linked = true, options = {})
    image.thumbnail(linked, options.merge(class: 'thumbnail'))
  end

  def large(linked = true, options = {})
    image.large(linked, options.merge(class: 'photograph'))
  end

  def url
    image.url
  end

  def photo_path(photo)
    Rails.application.routes.url_helpers.photo_path(photo)
  end

  def image_tag(source, options = {})
    ActionController::Base.helpers.image_tag(source, options)
  end

  def link_to(body, url, html_options = {})
    ActionController::Base.helpers.link_to(body, url, html_options = {})
  end

end

