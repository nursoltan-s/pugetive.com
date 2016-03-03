module ResumeHelper

  def timeline_row(dates, name, title, summary)
    first_column = content_tag(:div, dates, class: ['medium-2', 'columns'])
    second_column = content_tag(:div, '[art]', class: ['medium-1', 'columns'])
    info_html = content_tag(:span, "#{name}, ", class: 'name') + title
    summary_html = content_tag(:p, summary)

    third_column = content_tag(:div, info_html + summary_html, class: ['medium-9', 'columns'])
    return content_tag(:div, first_column + second_column + third_column, class: 'row')
  end

end