module ApplicationHelper
  def production?
    Rails.env == 'production'
  end

  def admin?
    current_user and current_user.admin?
  end

  def status(work)
    Work::STATUS_TEXT[work.status.to_sym]
  end

  def combo_status(work)
    content_tag(:b, status(work) + (work.status_message.blank? ? '' : ' ~ ')) +
    content_tag(:i, work.status_message, class: 'subdued')
  end

end
