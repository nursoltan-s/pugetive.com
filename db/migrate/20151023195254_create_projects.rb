class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :type, null: false, limit: 32
      t.integer :party_id, null: false
      t.string :url
      t.integer :start_year, null: false
      t.integer :stop_year
      t.text :description
      t.boolean :live, null: false

      t.timestamps null: false
    end
    add_index(:projects, :name)
    add_index(:projects, :type)
    add_index(:projects, :party_id)
    add_index(:projects, :start_year)
    add_index(:projects, :stop_year)
    add_index(:projects, :live)
  end
end
