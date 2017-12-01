class PartyPolicy < ApplicationPolicy

  def show?
    update?
  end

  def index?
    user and user.admin?
  end
end