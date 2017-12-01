class RolePolicy < ApplicationPolicy

  def index?
    update?
  end

  def show?
    update?
  end

end