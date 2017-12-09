class AwesomeIcon < Icon

  def to_html
    ActionController::Base.helpers.content_tag(:i, nil, class: ['fa', "fa-#{token}", 'icon'])
  end

end