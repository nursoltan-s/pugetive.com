class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants, force: true do |t|
      t.integer :work_id, null: false
      t.string :name, null: false
      t.integer :year
      t.timestamps
    end

    add_index(:variants, :work_id)
    add_index(:variants, :year)
  end
end
