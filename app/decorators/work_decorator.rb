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
    rv = h.link_to(model.name, model)
    if model.demo?
      text = work.music? ? ' [home demo]' : ' [prototype / rough draft]'
      rv += h.content_tag(:span, text, class: 'demo-warning')
    end
    rv
  end

end
