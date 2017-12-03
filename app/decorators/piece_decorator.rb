class PieceDecorator < WorkDecorator
  delegate_all

  def title
    if model.blog?
      return model.name
    end
    h.raw(h.link_to(model.name, model))
  end
end