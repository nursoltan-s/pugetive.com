class AddGenreIdToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :genre_id, :integer)
    add_index(:works, :genre_id)
  end
end
