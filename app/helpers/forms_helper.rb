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
    icon_html = icon_tag(icon_name)

    field_type = icon_field_type(field_name)
    field_html = f.send("#{field_type}_field", field_name, placeholder: field_name.to_s.titleize, class: 'field-input')
    icon_field_tag(icon_html, field_html, field_type)
  end

  def icon_submit(f, button_text = "Save", disable_text = "Saving...", options = {})
    icon_html = icon_tag('submit')
    field_html = submit_button(f, button_text, disable_text, options.merge(class: 'field-input'))
    icon_field_tag(icon_html, field_html, :submit)
  end

  def form_label(label)
    if label.nil?
      label = raw('&nbsp;')
    end
    content_tag(:div, label, class: 'medium-3 columns form-label')
  end

  def form_field(field)
    content_tag(:div, field, class: 'medium-7 columns form-field end')
  end

  def submit(f, text = 'Save', disable_text = 'Saving...', options = {})
    label_field(nil, submit_button(f, text, disable_text, options))
  end

  def submit_button(f, text = 'Save', disable_text = 'Saving...', options = {})
    f.submit(text, options.merge(data: {disable_with: disable_text}))
  end

  def new_button(token)
    link_to("New #{token.to_s.capitalize}", 
            send("new_#{token}_path"), 
            class: 'button', 
            data: {visible_to: 'admin'})
  end

  def document_fields(f, object)
    rv = ""
    f.fields_for :documents, object.documents.build do |data_field|
      rv = data_field.file_field :data
      rv += data_field.text_field :name
    end
    rv
  end

  def image_fields(f, object)
    rv = ""
    f.fields_for :images, object.images.build do |data_field|
      rv = data_field.file_field :data
      rv += data_field.text_field :name
    end
    rv
  end

  private

    def icon_field_type(field_name)
      field_type = :text
      [:email, :password, :submit].each do |token|
        if field_name.to_sym == token
          field_type = field_name
        end
      end
      field_type
    end

    def icon_tag(icon_name)
      icon_html = icon(icon_name)
      content_tag(:span, icon_html, class: 'field-icon')
    end

    def icon_field_tag(icon_html, field_html, field_type = :text)
      content_tag(:div, icon_html + field_html, class: ['icon-field', field_type])
    end

end

