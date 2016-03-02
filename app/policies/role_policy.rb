class RolePolicy < ApplicationPolicy

  def index?
    update?
  end
end