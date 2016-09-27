class AddIndexToLyrics < ActiveRecord::Migration[5.0]
  def change
    add_index(:lyrics, :work_id, unique: true)
  end
end
