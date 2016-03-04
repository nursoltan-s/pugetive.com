class UserPolicy < ApplicationPolicy

  def edit
    user and user.id == 1
  end
end