class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres, force: true do |t|
      t.integer :interest_id
      t.string :name

      t.timestamps
    end
    add_index(:genres, :interest_id)
    add_index(:genres, :name)
  end
end
