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
    if model.writing? and model.blog?
      rv = model.name
    else
      rv = h.link_to(model.name, model)
    end
    if model.music? and model.has_audio?
      rv += h.raw('&nbsp;') + h.audio_icon
    end
    if model.demo?
      text = work.music? ? ' [home demo]' : ' [prototype&nbsp;/&nbsp;rough&nbsp;draft]'
      rv += h.content_tag(:span, h.raw(text), class: 'demo-warning')
    end
    h.raw(rv)
  end

  def byline
    text = "by #{h.content_tag(:b, model.party.name)}"
    h.raw(h.content_tag(:p, h.raw(text), class: 'artist'))
  end

  def live_link
    return unless model.url.present? and model.live?
    h.raw(h.link_to(h.raw("Link #{h.external_icon}"), work.url))
  end

  def location_display
    return unless model.location.present?
    contents = h.content_tag(:span, model.location, class: 'location')
    h.raw(h.content_tag(:p, contents))
  end

  def lyric_display
    if model.has_lyric?
      return h.raw(h.render(model.lyric))
    end
    contents = h.link_to(h.raw("#{h.new_icon} Lyric"), h.new_lyric_path(work_id: model.id))
    h.raw(h.content_tag(:div, h.raw(contents), data: {visible_to: 'admin'}))
  end

  def genre_and_years
    p_contents = ''
    if model.genre
      p_contents += h.content_tag(:span, h.link_to(work.genre.name, work.genre), class: 'genre')
    end
    p_contents += h.content_tag(:div, work.years, class: 'years')
    return h.raw(h.content_tag(:p, h.raw(p_contents)))
  end

  def status
    h.raw(h.content_tag(:p, h.raw("Status: #{h.combo_status(work)}"), class: 'status'))
  end

  def thumbnail(link_to_original = false)
    return nil unless model.has_image?
    rv = ''
    image_html = h.image_tag(model.image.url(:thumb), class: 'thumbnail')
    if link_to_original
      contents = h.link_to(image_html, model.image.url(:large), target: "_blank")
    elsif model.url.present? and model.live?
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

  def genre_info
    return nil unless work.genre
    return h.link_to(model.genre.name, model.genre) + (model.music? ? ' song' : nil)
  end

  def photo_meta
    camera_info + source_website + license + prints_teaser
  end

  def camera_info
    return '' unless work.camera
    text = h.content_tag(:i, h.raw("Shot with #{work.camera.iphone? ? 'an' : 'a'} #{h.link_to(work.tools.first.name, work.tools.first)}"))
    h.content_tag(:div, text, class: 'camera')
  end

  def album_info
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


  def summary
    return if model.summary.blank?
    h.content_tag(:p, model.summary, class: 'summary')
  end

  def tools
    return unless model.tools.any?
    # Refactor
    rv = ''
    if model.active_tools.any?
      text = h.raw(model.active_tools.map{|t| h.link_to(t.name, t)}.join(', '))
      formatted_text = h.content_tag(:b, h.raw("Buzzwords: #{text}"))
      rv += h.content_tag(:p, formatted_text, class: 'tools')
    end
    if work.legacy_tools.any?
      text = h.raw(model.legacy_tools.map{|t| h.link_to(t.name, t)}.join(', '))
      formatted_text = h.content_tag(:b, h.raw("Legacy: #{text}"))
      rv += h.content_tag(:p, formatted_text, class: 'tools')
    end
    h.raw(rv)
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
    license_text = h.content_tag(:div, h.awesome_icon('creative-commons') + ' Attribution-NonCommercial')
    h.content_tag(:div, label + license_text, class: 'photo-license')
  end

  def prints_teaser
    h.mail_to('toddgehman@gmail.com', 'Contact me') + ' for prints or originals.'
  end


end
