class CreateWields < ActiveRecord::Migration
  def change
    create_table :wields do |t|
      t.integer :project_id, null: false
      t.integer :tool_id, null: false

      t.timestamps null: false
    end
    add_index(:wields, :project_id)
    add_index(:wields, :tool_id)
  end
end
