class PieceDecorator < WorkDecorator
  delegate_all

  def title
    if model.blog?
      return model.name
    end
    h.raw(h.link_to(model.name, model))
  end

  def collection_info
    return nil unless model.collections.any?
    list = ''
    model.collections.each do |collection|
      line = 'From the series '
      line += h.link_to(collection.name, collection)
      line += h.link_to(h.raw(h.icon(:delete)), SeriesWork.for(collection, piece), method: :delete, class: 'subdued', data: {visible_to: 'admin', confirm: 'Are you sure?'})
      line_item = h.content_tag(:li, h.raw(line))
      list += line_item
    end
    h.raw(h.content_tag(:ul, h.raw(list), class: 'series-list small'))
  end


end