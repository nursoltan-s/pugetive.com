module ApplicationHelper
  def production?
    Rails.env == 'production'
  end

  def admin?
    current_user and current_user.admin?
  end

  def status(work)
    case work.status.to_sym
    when :pre
      return "Pre-Production"
    when :production
      return "In Production"
    when :post
      return "Post-Production"
    when :scrapped
      return "Unfinished"
    when :retired
      return "Retired"
    when :released
      return "Released"
    end
  end

  def combo_status(work)
    content_tag(:b, status(work) + (work.status_message.blank? ? '' : ' ~ ')) +
    content_tag(:i, work.status_message, class: 'subdued')
  end
end
