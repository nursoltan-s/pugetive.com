module ResumeHelper

  def timeline_row(dates, name, title, summary, url = nil)
    first_column = content_tag(:div, dates, class: ['medium-2', 'columns'])
    second_column = content_tag(:div, experience_icon, class: ['medium-1', 'columns'])
    if title.blank?
      info_html = content_tag(:span, name, class: 'name')
    else
      info_html = content_tag(:span, "#{name}, ", class: 'name') + title
    end
    summary_html = content_tag(:p, summary)
    url_html = (url.blank? ? nil : link_to(url, url))

    third_column = content_tag(:div, info_html + summary_html + url, class: ['medium-9', 'columns'])
    return content_tag(:div, first_column + second_column + third_column, class: 'row')
  end

end