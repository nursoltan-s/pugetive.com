class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name, null: false
      t.string :type, null: false, limit: 16
      t.string :category, null: false, limit: 16
      t.boolean :front_end, null: false, default: false

      t.timestamps null: false
    end
    add_index(:tools, :name)
    add_index(:tools, :type)
  end
end
