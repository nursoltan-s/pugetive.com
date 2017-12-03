class SeriesDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def titles_and_tools
    titles_text = h.raw(model.titles.sort_by{|t| t.sort}.map{|t| h.link_to(t.name, t)}.join(', '))
    rv = h.content_tag(:span, h.raw(titles_text), class: 'titles')
    tools_text = h.raw(model.instruments.map{|t| h.link_to(t.name, t)}.join(', '))
    rv += h.content_tag(:span, h.raw(tools_text), class: 'tools')
    rv
  end
  def years_display
    contents = h.content_tag(:div, model.years, class: 'years')
    return h.raw(h.content_tag(:p, h.raw(contents)))
  end

  def artist_name
    return 'Unknown' unless series.works.any?
    rv = 'by '
    rv += h.content_tag(:b, series.artist.name)
    if series.artist.alias?
      rv += h.content_tag(:span, ' [solo alias]', class: 'subdued')
    end
    h.content_tag(:p, h.raw(rv), class: 'artist')

  end

end
