class WieldPolicy < ApplicationPolicy
  def show?
    update?
  end

  def index?
    update?
  end
end