# class ResumePolicy < Struct.new(:user, :statistic)
class ResumePolicy < ApplicationPolicy

  def show?
    update?
  end

end