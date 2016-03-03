class Endeavor

  include ActionView::Helpers
  include IconHelper

  attr_reader :subject, :icon

  def initialize(subject, icon)
    @subject = subject
    @icon = icon
  end

  def to_html
    content_tag(:div, date_column + raw(info_column), class: ['row', 'timeline-row'])
  end

  private

    def date_column
      content_tag(:div, subject.date_range, class: ['medium-2', 'columns', 'dates'])
    end

    def info_column
      content_tag(:div, raw(title) + summary, class: ['medium-10', 'columns'])
    end

    def title
      content_tag(:span, raw("#{decorated_name}#{subject.official_title.blank? ? nil : ', '}"), class: 'name') +
      subject.official_title +
      outbound_link
    end

    def summary
      content_tag(:p, subject.summary, class: 'summary')
    end

    # def url
    #   (subject.url.blank? ? nil : link_to(subject.url, subject.url))
    # end
    def outbound_link
      if subject.url.present? and subject.live?
        return link_to(raw("&nbsp;#{web_icon}"), subject.url, class: "super-subdued")
      end
    end

    def decorated_name
      "#{raw(icon)} #{subject.name}"
    end
end