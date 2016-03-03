module ResumeHelper

  def timeline_row(dates, name, roles)
    first_column = content_tag(:div, dates, class: ['medium-3', 'columns'])
    second_column = content_tag(:div, '[art]', class: ['medium-1', 'columns'])
    info_html = content_tag(:span, name, class: 'name') + roles.join(', ')

    third_column = content_tag(:div, info_html, class: ['medium-8', 'columns'])
    return content_tag(:div, first_column + second_column + third_column, class: 'row')
  end

end