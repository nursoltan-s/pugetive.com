class WorkDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def title
    if model.blog?
      rv = model.name
    else
      rv = h.link_to(model.name, model)
    end
    if model.has_audio?
      rv += h.raw('&nbsp;') + h.audio_icon
    end
    if model.demo?
      text = work.music? ? ' [home demo]' : ' [prototype / rough draft]'
      rv += h.content_tag(:span, text, class: 'demo-warning')
    end
    rv
  end

  def has_image?
    model.image.url.present? and 
      not model.image.url(:thumb).match(/missing/)
  end

  def thumbnail
    return nil unless has_image?
    rv = ''
    image_html = h.image_tag(model.image.url(:thumb))
    if model.url.present? and model.live?
      contents = h.link_to(image_html, model.url)
    else
      contents = image_html
    end
    h.content_tag(:div, contents, class: 'screenshot')
  end


  def titles_and_instruments
    list = []
    titles.each do |title|
      if title.name == 'Performer'
        instruments = ''
        if model.tools.instruments.any? 
          instruments = ' (' + h.raw(model.tools.instruments.sorted.map{|i| h.raw(h.link_to(i.name, i))}.join(', ')) + ')'
        end
        list << (h.link_to(title.name, title) + h.raw(h.content_tag(:span, h.raw(instruments), class: 'small')))
      else
        list << h.link_to(title.name, title)
      end
    end
    h.raw(h.content_tag(:p, h.raw(list.join(', ')), class: 'titles'))

  end

  def series_info
    return nil unless work.series.any?
    list = ''
    work.series_works.each do |series_work|
      series = series_work.series
      line = 'From the '
      line += work.interest.series_name.downcase + ' '
      line += h.link_to(series.name, series)
      line += h.link_to(h.raw(h.destroy_icon), series_work, method: :delete, class: 'subdued', data: {visible_to: 'admin', confirm: 'Are you sure?'})
      line_item = h.content_tag(:li, h.raw(line))
      list += line_item
    end
    h.raw(h.content_tag(:ul, h.raw(list), class: 'series-list small'))
  end

  def genre_info
    return nil unless work.genre
    return h.link_to(model.genre.name, model.genre) + (model.music? ? ' song' : nil)
  end

  def photo_meta
    label = h.content_tag(:b, 'Photo License "CC BY-NC"')
    license_text = h.content_tag(:div, h.awesome_icon('creative-commons') + ' Attribution-NonCommercial')
    prints_teaser = h.mail_to('toddgehman@gmail.com', 'Contact me') + ' for prints or originals.'
    license = h.content_tag(:div, label + license_text + h.content_tag(:div, prints_teaser), class: 'photo-license')

    source = nil
    if model.flickr_id.present?
      source = 'Originally posted to ' + h.flickr_link(model.flickr_id)
    elsif model.instagram_id.present?
      source = 'Originally posted to ' + h.instagram_link(model.instagram_id)
    end
    return h.content_tag(:div, h.raw(source) + license)
  end

end
