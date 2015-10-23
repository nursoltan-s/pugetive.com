class AboutPolicy < Struct.new(:user, :about)

  def home?
    true
  end

end