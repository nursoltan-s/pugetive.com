class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :category
      t.boolean :pro
      t.integer :start_year
      t.integer :stop_year
      t.text :description
      t.string :status

      t.timestamps null: false
    end
  end
end
