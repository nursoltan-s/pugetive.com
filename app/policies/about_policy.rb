class AboutPolicy < Struct.new(:user, :about)

  def home?
    true
  end

  def about?
    user and user.admin?
  end

  def touch?
    user and user.admin?
  end

  def status?
    user and user.admin?
  end

  def edit?
    user and user.admin?
  end
end