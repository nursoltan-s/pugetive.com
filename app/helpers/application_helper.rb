module ApplicationHelper
  def production?
    Rails.env == 'production'
  end

  def admin?
    current_user and current_user.admin?
  end

  def status(token)
    case token.to_sym
    when :pre
      return "Pre-Production"
    when :production
      return "Production"
    when :post
      return "Post-Production"
    when :scrapped
      return "Unfinished"
    when :retired
      return "Retired"
    end
  end
end
