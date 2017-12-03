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
