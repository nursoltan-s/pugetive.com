module FormsHelper

  def handle_errors(subject)
    return if subject.errors.empty?
    flash.now[:alert] = raw(subject.errors.full_messages.join('<br />'))
  end

  def label_field(label, field = nil, options = {})
    contents = form_label(label)
    if field
      contents += form_field(field)
    end

    content_tag(:div, contents, options.merge(class: 'row'))
  end

  def icon_field(f, field_name, icon_name = field_name)
    icon = self.send("#{icon_name}_icon")
    icon_html = content_tag(:span, icon, class: 'field-icon')

    field_type = :text
    [:email, :password, :submit].each do |token|
      if field_name.to_sym == token
        field_type = field_name
      end
    end

    field_method = "#{field_type}_field"
    if field_type.to_sym == :submit
      field_html = submit_button(f, field_name.to_s.titleize, 'Sending...', class: 'field-input')
    else
      field_html = f.send(field_method, field_name, placeholder: field_name.to_s.titleize, class: 'field-input')
    end
    return content_tag(:div, icon_html + field_html, class: ['icon-field', field_type])
  end

  def form_label(label)
    content_tag(:div, label, class: 'small-12 medium-3 large-3 columns form-label')
  end

  def form_field(field)
    content_tag(:div, field, class: 'small-12 medium-9 large-9 columns form-field')
  end

  def submit(f, text = 'Save', disable_text = 'Saving...', options = {})
    label_field(nil, submit_button(f, text, disable_text, options))
  end

  def submit_button(f, text = 'Save', disable_text = 'Saving...', options = {})
    f.submit(text, options.merge(data: {disable_with: disable_text}))
  end

end

