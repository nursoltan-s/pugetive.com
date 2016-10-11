class ChangeWorksToUsePlaces < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :place_id, :integer)
    add_index(:works, :place_id)
  end
end
