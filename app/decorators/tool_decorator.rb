class ToolDecorator < Draper::Decorator
  delegate_all

  def type_info
    case model.category
    when 'Photography'
      if model.type == 'Instrument'
        return 'Camera'
      end
    else
      return "#{model.category} #{model.type}"
    end
  end

  def tool_list_info
    h.raw("Listing #{model.interest.work_name.downcase.pluralize} made with #{h.content_tag(:i, model.name)}.")
  end
end