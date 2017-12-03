class SongDecorator < WorkDecorator
  delegate_all

  def player_row
    return unless model.has_audio?
    row_contents = h.content_tag(:th, 'Audio') +
                   h.content_tag(:td, player)
    h.content_tag(:tr, h.raw(row_contents))
  end

  def player
    h.audio_player(model)
  end

  def album_info
    return nil unless model.albums.any?
    list = ''
    model.albums.each do |album|
      line = 'From the album '
      line += h.link_to(album.name, album)
      line += h.link_to(h.raw(h.destroy_icon), SeriesWork.for(album, song), method: :delete, class: 'subdued', data: {visible_to: 'admin', confirm: 'Are you sure?'})
      line_item = h.content_tag(:li, h.raw(line))
      list += line_item
    end
    h.raw(h.content_tag(:ul, h.raw(list), class: 'series-list small'))
  end



  def roles_table(visibility_class = nil)
    row = h.render("works/roles_table_row", work: model)
    h.raw(h.content_tag(:table, h.raw(row), class: ['compact', visibility_class]))
  end
end