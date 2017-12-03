class AlbumDecorator < SeriesDecorator
  delegate_all


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