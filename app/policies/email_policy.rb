class EmailPolicy < ApplicationPolicy

  def index?
    user and user.admin?
  end
end