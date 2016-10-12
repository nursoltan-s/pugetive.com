class AddInstagramIdToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :instagram_id, :string)
    add_index(:works, :instagram_id)
  end
end
