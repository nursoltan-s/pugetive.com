class SongDecorator < WorkDecorator
  delegate_all

  def title
    rv = h.link_to(model.name, model)
    if model.has_audio?
      rv += h.raw('&nbsp;') + h.icon(:audio)
    end
    if model.demo?
      text = ' [home demo]'
      rv += h.content_tag(:span, h.raw(text), class: 'demo-warning')
    end
    h.raw(rv)
  end

  def byline
    text = "by #{h.content_tag(:b, model.party.name)}"
    if model.party.alias?
      text += h.content_tag(:i, ' [solo alias]', class: 'subdued')
    end

    h.raw(h.content_tag(:p, h.raw(text), class: 'artist'))
  end


  def titles_display
    list = []
    titles.each do |title|
      if title.name == 'Performer'
        list << instruments_list
      else
        list << h.link_to(title.name, title)
      end
    end
    h.raw(h.content_tag(:p, h.raw(list.join(', ')), class: 'titles'))
  end

  def player_row
    return unless model.has_audio?
    row_contents = h.content_tag(:th, 'Audio') +
                   h.content_tag(:td, song.audio_player)
    h.content_tag(:tr, h.raw(row_contents))
  end

  def album_info
    return nil unless model.albums.any?
    list = ''
    model.albums.each do |album|
      line = 'From the album '
      line += h.link_to(album.name, album)
      line += h.link_to(h.raw(h.icon(:delete)), SeriesWork.for(album, song), method: :delete, class: 'subdued', data: {visible_to: 'admin', confirm: 'Are you sure?'})
      line_item = h.content_tag(:li, h.raw(line))
      list += line_item
    end
    h.raw(h.content_tag(:ul, h.raw(list), class: 'series-list small'))
  end

  def roles_table(visibility_class = nil)
    row = h.render("works/roles_table_row", work: model)
    h.raw(h.content_tag(:table, h.raw(row), class: ['compact', visibility_class]))
  end

  def instruments_list
    instruments = ''
    if model.tools.instruments.any?
      instruments = ' (' + h.raw(model.tools.instruments.sorted.map{|i| h.raw(h.link_to(i.name, i))}.join(', ')) + ')'
    end
    h.raw(h.link_to(title.name, title) + h.raw(h.content_tag(:span, h.raw(instruments), class: 'small')))
  end

end