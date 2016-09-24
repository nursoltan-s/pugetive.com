class ConvertRolesToWorks < ActiveRecord::Migration[5.0]
  def change
    Role.delete_all
    rename_column(:roles, :project_id, :work_id)
  end
end
