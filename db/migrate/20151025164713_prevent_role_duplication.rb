class PreventRoleDuplication < ActiveRecord::Migration
  def change
    add_index(:roles, [:project_id, :title_id], unique: true)
  end
end
