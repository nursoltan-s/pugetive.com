class PhotoDecorator < WorkDecorator
  delegate_all

  def photo_meta
    camera_info + source_website + license + prints_teaser
  end

  def camera_info
    return '' unless work.camera
    text = h.content_tag(:i, h.raw("Shot with #{work.camera.iphone? ? 'an' : 'a'} #{h.link_to(work.tools.first.name, work.tools.first)}"))
    h.content_tag(:div, text, class: 'camera')
  end

  def source_website
    source = 'Originally posted to '

    if model.flickr_id.present?
      source += + h.flickr_link(model.flickr_id)
    elsif model.instagram_id.present?
      source += h.instagram_link(model.instagram_id)
    end
    h.raw(h.content_tag(:i, h.raw(source)))
  end

  def license
    label = h.content_tag(:b, 'Photo License "CC BY-NC"')
    license_text = h.content_tag(:div, h.icon('creative-commons') + ' Attribution-NonCommercial')
    h.content_tag(:div, label + license_text, class: 'photo-license')
  end

  def prints_teaser
    h.mail_to('toddgehman@gmail.com', 'Contact me') + ' for prints or originals.'
  end


end