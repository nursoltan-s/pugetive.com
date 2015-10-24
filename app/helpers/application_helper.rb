module ApplicationHelper
  def production?
    Rails.env == 'production'
  end

  def admin?
    current_user and current_user.admin?
  end
end
