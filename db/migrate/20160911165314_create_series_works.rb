class CreateSeriesWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :series_works do |t|
      t.integer :series_id, null: false
      t.integer :work_id, null: false

      t.timestamps
    end
    create_index(:series_works, :series_id)
    create_index(:series_works, :work_id)
    create_index(:series_works, [:series_id, :work_id], unique: true)
  end
end
