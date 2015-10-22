module IconHelper
  def delete_icon
    content_tag(:i, nil, class: 'fi-x-circle')
  end

  def new_icon
    delete_icon
  end
end
