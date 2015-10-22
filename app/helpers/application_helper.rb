module ApplicationHelper
  def production?
    Rails.env == 'production'
  end
end
