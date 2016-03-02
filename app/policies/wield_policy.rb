class WieldPolicy < ApplicationPolicy
  def index?
    update?
  end
end