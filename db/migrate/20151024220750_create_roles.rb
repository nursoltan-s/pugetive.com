class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :project_id, null: false
      t.integer :title_id, null: false

      t.timestamps null: false
    end

    add_index(:roles, :project_id)
    add_index(:roles, :title_id)
  end
end
