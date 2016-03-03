module ResumeHelper

  def timeline_row(dates, name, title, summary, url = nil)
    date_column = content_tag(:div, dates, class: ['medium-2', 'columns', 'dates'])
    # second_column = content_tag(:div, experience_icon, class: ['medium-1', 'columns'])
    icon_name = "#{raw(experience_icon)} #{name}"
    if title.blank?
      info_html = content_tag(:span, raw(icon_name), class: 'name')
    else
      info_html = content_tag(:span, raw("#{icon_name}, "), class: 'name') + title
    end
    summary_html = content_tag(:p, summary)
    url_html = (url.blank? ? nil : link_to(url, url))

    info_column = content_tag(:div, raw(info_html) + summary_html + url, class: ['medium-10', 'columns'])
    return content_tag(:div, date_column + raw(info_column), class: ['row', 'timeline-row'])
  end

end