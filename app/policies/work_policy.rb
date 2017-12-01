class WorkPolicy < ApplicationPolicy

  def tools?
    show?
  end
end