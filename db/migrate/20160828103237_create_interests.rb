class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :name, limit: 32, null: false
      t.integer :sort, null: false
      t.string :token, limit: 32
      t.string :work_name, limit: 32, null: false
      t.string :series_name, limit: 32, null: false
      t.timestamps
    end

    add_index :interests, :sort
    add_index :interests, :token
  end
end
