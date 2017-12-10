class FoundationIcon < Icon

  def self.model_name
    Icon.model_name
  end

  def to_html
    ActionController::Base.helpers.content_tag(:i, nil, class: ["fi-#{token}", 'icon'])
  end
end