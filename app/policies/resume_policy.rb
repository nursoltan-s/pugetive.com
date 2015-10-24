class ResumePolicy < Struct.new(:user, :statistic)

  def show?
    true
  end

end