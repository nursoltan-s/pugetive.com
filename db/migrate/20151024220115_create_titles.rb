class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name, null: false
      t.string :category, null: false, limit: 16

      t.timestamps null: false
    end
    add_index(:titles, :name)
    add_index(:titles, :category)
  end
end
