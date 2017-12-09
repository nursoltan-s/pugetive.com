class FoundationIcon < Icon

  def to_html
    ActionController::Base.helpers.content_tag(:i, nil, class: ["fi-#{token}", 'icon'])
  end
end