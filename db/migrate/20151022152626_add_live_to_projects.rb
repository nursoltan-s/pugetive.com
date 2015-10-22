class AddLiveToProjects < ActiveRecord::Migration
  def change
    remove_column(:projects, :status)
    add_column(:projects, :live, :boolean, default: true)
  end
end
