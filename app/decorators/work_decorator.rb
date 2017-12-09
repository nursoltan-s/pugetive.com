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

  # REFACTOR
  def thumbnail(link_to_original = false)
    return nil unless model.has_image?
    rv = ''
    image_html = h.image_tag(model.image.url(:thumb), class: 'thumbnail')
    if link_to_original
      contents = h.link_to(image_html, model.image.url(:large), target: "_blank")
    elsif model.url.present? and model.live?
      contents = h.link_to(image_html, model.url)
    else
      contents = image_html
    end
    h.content_tag(:div, contents, class: 'screenshot')
  end


  def title
    h.raw(h.link_to(model.name, model))
  end

  def byline
    text = "by #{h.content_tag(:b, model.party.name)}"
    h.raw(h.content_tag(:p, h.raw(text), class: 'artist'))
  end

  def live_link
    return unless model.url.present?
    if model.live?
      h.raw(h.link_to(h.raw("Live link #{h.icon(:external)}"), work.url))
    elsif model.archived?
      h.raw(h.link_to(h.raw("Internet archive #{h.icon(:external)}"), work.url))
    end
  end

  def location_display
    return unless model.location.present?
    contents = h.content_tag(:span, model.location, class: 'location')
    h.raw(h.content_tag(:p, contents))
  end

  def genre_and_years(show_genre = true)
    p_contents = ''
    if model.genre and show_genre
      p_contents += h.content_tag(:span, h.link_to(model.genre.name, model.genre), class: 'genre')
    end
    p_contents += h.content_tag(:div, model.years, class: 'years')
    return h.raw(h.content_tag(:p, h.raw(p_contents)))
  end

  def years_display
    genre_and_years(false)
  end

  def status
    h.raw(h.content_tag(:p, h.raw("Status: #{h.combo_status(work)}"), class: 'status'))
  end

  def titles_display
    list = titles.map{|t| h.raw(h.link_to(t.name, t))}
    h.raw(h.content_tag(:p, h.raw(list.join(', ')), class: 'titles'))
  end

  def genre_info
    return nil unless work.genre
    return h.link_to(model.genre.name, model.genre) + (model.music? ? ' song' : nil)
  end

  def summary_display
    return if model.summary.blank?
    h.content_tag(:p, model.summary, class: 'summary')
  end

  def tools_display(label = true)
    h.raw(active_tools_display(label) + legacy_tools_display(label))
  end

  def lyric_display
    if model.has_lyric?
      return h.raw(h.render(model.lyric))
    end
    contents = h.link_to(h.raw("#{h.icon(:new)} Lyric"), h.new_lyric_path(work_id: model.id))
    h.raw(h.content_tag(:div, h.raw(contents), data: {visible_to: 'admin'}))
  end

  private

    def active_tools_display(label = true)
      rv = ''
      if model.active_tools.any?
        text = h.raw(model.active_tools.map{|t| h.link_to(t.name, t)}.join(', '))
        formatted_text = h.content_tag(:b, h.raw(label ? "Buzzwords: #{text}" : text))
        rv += h.content_tag(:p, formatted_text, class: 'tools')
      end
      h.raw(rv)
    end

    def legacy_tools_display(label = true)
      if work.legacy_tools.any?
        text = h.raw(model.legacy_tools.map{|t| h.link_to(t.name, t)}.join(', '))
        formatted_text = h.content_tag(:b, h.raw("Legacy: #{text}"))
        rv += h.content_tag(:p, formatted_text, class: 'tools')
      end
    end


end
