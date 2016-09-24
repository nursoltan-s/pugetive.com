class UpdateWieldsForWorks < ActiveRecord::Migration[5.0]
  def change
    Wield.destroy_all
    rename_column(:wields, :project_id, :work_id)
  end
end
