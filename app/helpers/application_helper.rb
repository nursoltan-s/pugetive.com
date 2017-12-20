module ApplicationHelper
  def production?
    Rails.env == 'production'
  end

  def development?
    Rails.env == 'development'
  end

  def admin?
    current_user and current_user.admin?
  end

  def home_page?
    current_page?(root_path)
  end

  def status(work)
    Work::STATUS_TEXT[work.status.to_sym]
  end

  def combo_status(work)
    content_tag(:b, status(work) + (work.status_message.blank? ? '' : ' ~ ')) +
    content_tag(:i, work.status_message, class: 'subdued')
  end

end
