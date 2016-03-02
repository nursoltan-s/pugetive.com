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

  def form_label(label)
    content_tag(:div, label, class: 'small-12 medium-3 large-3 columns form-label')
  end

  def form_field(field)
    content_tag(:div, field, class: 'small-12 medium-9 large-9 columns form-field')
  end

  def submit(f, text = 'Save', disable_text = 'Saving...')
    label_field(nil, f.submit(text, data: {disable_with: disable_text}))
  end

end
