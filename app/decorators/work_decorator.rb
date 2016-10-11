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
    work.series.each do |series|
      line = 'From the '
      line += work.interest.series_name.downcase + ' '
      line += h.link_to(series.name, series)
      line_item = h.content_tag(:li, h.raw(line))
      list += line_item
    end
    h.raw(h.content_tag(:ul, h.raw(list), class: 'series-list'))
  end

  def genre_info
    return nil unless work.genre
    return h.link_to(model.genre.name, model.genre) + (model.music? ? ' song' : nil)
  end    
end
