class AlbumDecorator < SeriesDecorator
  delegate_all


  def titles_and_tools
    titles_text = h.raw(model.titles.sort_by{|t| t.sort}.map{|t| h.link_to(t.name, t)}.join(', '))
    rv = h.content_tag(:span, h.raw(titles_text), class: 'titles')
    tools_text = h.raw(model.tools.instruments.map{|t| h.link_to(t.name, t)}.join(', '))
    rv += h.content_tag(:span, h.raw(tools_text), class: 'tools')
    rv
  end

  def byline
    # Only a safe assumption as long as we have multi-artist albums
    artist = model.songs.first.party

    text = "by #{h.content_tag(:b, artist.name)}"
    if artist.alias?
      text += h.content_tag(:i, ' [solo alias]', class: 'subdued')
    end

    h.raw(h.content_tag(:p, h.raw(text), class: 'artist'))
  end

end